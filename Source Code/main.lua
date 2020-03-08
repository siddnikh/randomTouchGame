function love.load()
  circle = {}
  circle.x = love.graphics.getWidth()/2
  circle.y = love.graphics.getHeight()/2
  circle.size = 50

  gameTime = 10
  gameOver = true
  score = 0
  newFont = love.graphics.newFont(40)


end

function love.update(dt)
if gameOver == false then
 gameTime = gameTime - dt
 if gameTime <= 0 then
  gameOver = true
  score = 0 end end
end

function love.draw()

scoreDisplay = "Score: " .. tostring(score)
if gameOver == false then
love.graphics.print("Time: ".. tostring(math.floor(gameTime)), 0, love.graphics.getHeight()-30)
else love.graphics.print("Game Over", 0 , love.graphics.getHeight() - 30 ) end

love.graphics.setColor(0, 123, 123)
love.graphics.circle("fill", circle.x, circle.y, circle.size)

love.graphics.setColor(255, 255, 255, 1)
love.graphics.setFont(newFont)
love.graphics.print(scoreDisplay, 20)

love.graphics.setFont(love.graphics.newFont(30))
love.graphics.setColor(255, 0, 0)
love.graphics.print("The randomTouch Game", 260, 10)

end

function love.mousepressed(mouseX, mouseY, button, isTouch)
  if button == 1 then
    gameOver = false
    if distance(circle.x, circle.y, mouseX, mouseY) < circle.size
    then
      score = score + 1
      circle.x = math.random(circle.size, love.graphics.getWidth()-circle.size)
      circle.y = math.random(50+circle.size, love.graphics.getHeight()-circle.size)
    end
  end
end

function distance(x1, y1, x2, y2)
  return math.sqrt((y2-y1)^2 + (x2 - x1)^2)
end
