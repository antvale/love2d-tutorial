--! file: rectangle.lua

require("properties")

-- Pass Object as first argument.
Rectangle = Object.extend(Object)

function Rectangle.new(self)
    self.name="rect"
    self.x=200
    self.y=100
    self.width=50
    self.height=50
    self.speed=100
    self.direction=1
end

function Rectangle.checkCollition(self, rect)
    local a_left = self.x
    local a_right = self.x + self.width
    local a_top = self.y
    local a_bottom = self.y + self.height

    local b_left = rect.x
    local b_right = rect.x + rect.width
    local b_top = rect.y
    local b_bottom = rect.y + rect.height

    --Directly return this boolean value without using if-statement
    return  a_right > b_left
        and a_left < b_right
        and a_bottom > b_top
        and a_top < b_bottom
end

function Rectangle.update(self, dt)
    if (self.x>=maxScreenWidth-self.width) then
        self.direction=-1
    elseif (self.x<=0) then
        self.direction=1
    end
    self.x = self.x + self.direction * self.speed * dt
end

function Rectangle.draw(self,mode)
    love.graphics.rectangle(mode, self.x, self.y, self.width, self.height)
end

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