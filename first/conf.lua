--! conf file
require("properties")

function love.conf(t)
    t.window.width=maxScreenWidth
    t.window.height=maxScreenHeight
    t.window.title="My First Game with Love"
end