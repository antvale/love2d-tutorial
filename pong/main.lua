--! file: main.lua
function love.load()
    Object = require "classic"
    require "properties"
    require "player"
    require "enemy"
    require "bullet"
    require "score"
    require "intro"

    player = Player()
    enemy = Enemy()
    score = Score()
    intro = Intro()
    
    listOfBullets = {}

end

function love.keypressed(key)
    if (state == States.INTRO) then
        intro:keyPressed(key)
    else
        player:keyPressed(key)
    end
end

function love.update(dt)
    if (state == States.INTRO) then
        intro:update()
    else
        player:update(dt)
        enemy:update(dt)

        for i,v in ipairs(listOfBullets) do
            v:update(dt)
            v:checkCollision(enemy)

            --If the bullet has the property dead and it's true then..
            if v.dead then
                --Remove it from the list
                table.remove(listOfBullets, i)
                --Increase the score
                score:increase()
            end
        end
    end
end

function love.draw()
    if (state == States.INTRO) then
        intro:draw()
    else
        player:draw()
        enemy:draw()
        score:draw()
        for i,v in ipairs(listOfBullets) do
            v:draw()
        end
    end
end