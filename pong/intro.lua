--! file intro.lua
require("properties")

Intro= Object:extend()

function Intro:new()
    self.introImage=love.graphics.newImage("treePalm.png");
end

function Intro:keyPressed(key)
    if key == "return" then
        state = States.START
    end
end

function Intro:update(dt)

end

function Intro:draw()
    love.graphics.draw(self.introImage)
    love.graphics.setFont(love.graphics.newFont(18))
    love.graphics.print("Shot the snake!",WIDTH/2,HEIGHT/2-30)
    love.graphics.print("Press Enter to start!",WIDTH/2,HEIGHT/2)
end
