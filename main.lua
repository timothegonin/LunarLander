-- PRINTER
io.stdout:setvbuf('no')

local Lander = {}
Lander.x = 0
Lander.Y = 0
Lander.angle = -90
Lander.velocity_x = 0
Lander.velocity_y = 0
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
  --Lander.velocity_y = Lander.velocity_y + (0.6 * dt)

  --direction
  if love.keyboard.isDown("right") then
    Lander.angle = Lander.angle + (90 * dt)
  end
  if love.keyboard.isDown("left") then
    Lander.angle = Lander.angle - (90 * dt)
  end
  --engine on
  if love.keyboard.isDown("up") then
    Lander.engineOn = true
  else 
    Lander.engineOn = false
  end

  Lander.x = Lander.x + Lander.velocity_x
  Lander.y = Lander.y + Lander.velocity_y
end

function love.draw()
  love.graphics.draw(Lander.image, Lander.x, Lander.y, math.rad(Lander.angle), 1, 1, Lander.image:getWidth()/2, Lander.image:getHeight()/2)
  
  if Lander.engineOn == true then 
    love.graphics.draw(Lander.image_engine, Lander.x, Lander.y, math.rad(Lander.angle), 1, 1, Lander.image_engine:getWidth()/2, Lander.image_engine:getHeight()/2)
  end
end