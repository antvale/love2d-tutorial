--! file: player.lua
Player = Object:extend()

function Player:new()
    self.image = love.graphics.newImage("chicken.png")
    self.x = 300
    self.y = 20
    self.speed = 500
    self.width = self.image:getWidth()
    self.height= self.image:getHeight()
end

function Player:update(dt)
    if love.keyboard.isDown("left") then
        self.x = self.x - self.speed * dt
    elseif love.keyboard.isDown("right") then
        self.x = self.x + self.speed * dt
    end

    --Get the width of the window
    local window_width = love.graphics.getWidth()

    --If the left side is too far too the left then..
    if self.x < 0 then
        --Set x to 0
        self.x = 0
    --Else, if the right side is too far to the right then..
    elseif self.x + self.width > window_width then
        --Set the right side to the window's width.
        self.x = window_width - self.width
    end
end

function Player:draw()
    love.graphics.draw(self.image, self.x, self.y)
end

--! file: player.lua
function Player:keyPressed(key)
    --If the spacebar is pressed
    if key == "space" then
        --define (x,y) for the bullets
        local bullet_x, bullet_y
        bullet_x=self.x+self.width/2
        bullet_y=self.y+self.height/2
        --Put a new instance of Bullet inside listOfBullets
        table.insert(listOfBullets, Bullet(bullet_x, bullet_y))
    end
end