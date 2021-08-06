--! main script

--! require section
require("properties")

local x1=30

function love.load()
    love.graphics.setBackgroundColor( 1, 1, 1)
    Object = require "classic"
    require "rectangle"
    listOfRectangles = {}
    createRect("FIRST",200)
    createRect("SECOND",150)
    myImage=love.graphics.newImage("beagle.png")
    width = myImage:getWidth()
    height = myImage:getHeight()
end

function trace(x)
  print("x:",x)
end

function createRect(name,sp)
    local rect=Rectangle()
    rect.name=name
    rect.speed=sp
    table.insert(listOfRectangles, rect)
end

function love.update(dt)
    
    if (love.keyboard.isDown("right") and x1<= maxScreenWidth-30) then
        x1 = x1 + 100 * dt
    elseif (love.keyboard.isDown("left") and x1>=30) then
        x1 = x1 - 150 * dt
    end
    for i,v in ipairs(listOfRectangles) do 
        v.update(v,dt)
    end
end

function love.draw()
  local mode="line"
  love.graphics.draw(myImage, 10, 10,0,1,1,width/2,height/2)

  love.graphics.setColor(1,1,1)
  love.graphics.print("Simple first program with Love2d",0,0)
  love.graphics.setColor(0.5,0.5,1)
  -- print(listOfRectangles[1].name)
  -- print(listOfRectangles[2].name)

  --[[
  if (listOfRectangles[1].ckeckCollition(listOfRectangles[1],listOfRectangles[2])) then
    mode="line"
  else
    mode="fill"
  end
  ]]--

  if (checkCollition(listOfRectangles[1],listOfRectangles[2])) then
    mode="line"
  else
    mode="fill"
  end

  for i,v in ipairs(listOfRectangles) do
    v.draw(v,mode)
  end

  

  love.graphics.circle("fill",x1,700,30)
  love.graphics.setColor(0.2, 0.4, 0.9)
  love.graphics.draw(myImage, 10, 10)

end

--[[
function checkCollition(rect1, rect2)
    local a_left = rect1.x
    local a_right = rect1.x + rect1.width
    local a_top = rect1.y
    local a_bottom = rect1.y + rect1.height

    local b_left = rect2.x
    local b_right = rect2.x + rect2.width
    local b_top = rect2.y
    local b_bottom = rect2.y + rect2.height

    --Directly return this boolean value without using if-statement
    return  a_right > b_left
        and a_left < b_right
        and a_bottom > b_top
        and a_top < b_bottom
end
]]--