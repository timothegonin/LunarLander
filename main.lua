-- PRINTER
io.stdout:setvbuf('no')

local Lander = {}
Lander.x = 0
Lander.Y = 0
Lander.angle = -90
Lander.velocity_x = 0
Lander.velocity_y = 0
Lander.image = love.graphics.newImage('images/ship.png')

function love.load()
  screen_width = love.graphics.getWidth()
  screen_height = love.graphics.getHeight()

  Lander.x = screen_width/2
  Lander.y = screen_height/2
end

function love.update(dt)
  Lander.velocity_y = Lander.velocity_y + (0.6 * dt)

  Lander.x = Lander.x + Lander.velocity_x
  Lander.y = Lander.y + Lander.velocity_y
end

function love.draw()
  love.graphics.draw(Lander.image, Lander.x, Lander.y, math.rad(Lander.angle), 1, 1, Lander.image:getWidth()/2, Lander.image:getHeight()/2)
end