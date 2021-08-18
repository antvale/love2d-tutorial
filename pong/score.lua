--! file: score.lua
Score = Object:extend()

function Score:new()
    self.score=0
end

function Score:increase()
    self.score = self.score+1
end

function Score:decrease()
    self.score=self.score-1
end

function Score:reset()
    self.score=0
end

function Score:bonus(bonus)
    self.score=self.score+bonus
end

function Score:draw()
    --love.graphics.print(string.format("Score:%s",self.score),0,0)
    love.graphics.print(("Score:%s"):format(self.score),0,0)
end
