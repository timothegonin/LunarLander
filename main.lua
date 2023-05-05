-- PRINTER
io.stdout:setvbuf('no')

local Lander = {}
Lander.x = 0
Lander.Y = 0
Lander.angle = 270
Lander.velocity_x = 0
Lander.velocity_y = 0
Lander.speed = 3
Lander.image = love.graphics.newImage('images/ship.png')
Lander.image_engine = love.graphics.newImage('images/engine.png')
Lander.engineOn = false

function love.load()
  screen_width = love.graphics.getWidth()
  screen_height = love.graphics.getHeight()

  Lander.x = screen_width/2
  Lander.y = screen_height/2
end

function love.update(dt)

  --direction
  if love.keyboard.isDown("right") then
    Lander.angle = Lander.angle + (90 * dt)
    if Lander.angle > 360 then Lander.angle = 0 end
  end
  if love.keyboard.isDown("left") then
    Lander.angle = Lander.angle - (90 * dt)
    if Lander.angle < 0 then Lander.angle = 360 end
  end
  --engine on
  if love.keyboard.isDown("up") then
    Lander.engineOn = true

    --acceleration
    local angle_radian = math.rad(Lander.angle)
    local x_force = math.cos(angle_radian) * (Lander.speed * dt)
    local y_force = math.sin(angle_radian) * (Lander.speed * dt)
    Lander.velocity_x = Lander.velocity_x + x_force
    Lander.velocity_y = Lander.velocity_y + y_force    
  else 
    Lander.engineOn = false
  end

  Lander.velocity_y = Lander.velocity_y + (0.6 * dt)

  --speed limit
  if math.abs(Lander.velocity_x) > 1 then
    if Lander.velocity_x > 0 then
      Lander.velocity_x = 1
    else 
      Lander.velocity_x = -1
    end
  end

  if math.abs(Lander.velocity_y) > 1 then
    if Lander.velocity_y > 0 then
      Lander.velocity_y = 1
    else 
      Lander.velocity_y = -1
    end
  end

  Lander.x = Lander.x + Lander.velocity_x
  Lander.y = Lander.y + Lander.velocity_y
end

function love.draw()
  love.graphics.draw(Lander.image, Lander.x, Lander.y, math.rad(Lander.angle), 1, 1, Lander.image:getWidth()/2, Lander.image:getHeight()/2)
  
  if Lander.engineOn == true then 
    love.graphics.draw(Lander.image_engine, Lander.x, Lander.y, math.rad(Lander.angle), 1, 1, Lander.image_engine:getWidth()/2, Lander.image_engine:getHeight()/2)
  end

  local sDebug = "xxx"
  sDebug = sDebug.."angle = "..tostring(Lander.angle)
  sDebug = sDebug.."speed_x = "..tostring(Lander.velocity_x)
  sDebug = sDebug.."speed_y = "..tostring(Lander.velocity_y)
  love.graphics.print(sDebug,0,0)
end