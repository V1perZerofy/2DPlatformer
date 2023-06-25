function love.load()
    love.graphics.setBackgroundColor(1, 1, 1)
    love.window.setMode(20 * 32, 20 * 32)
    camera = require('libraries/camera')
    anim8 = require('libraries/anim8')
    love.graphics.setDefaultFilter("nearest", "nearest")
    sti = require('libraries/sti')
    wf = require('libraries/windfield')

    require('src/map')
    require('src/player')

    -- Initialize the world with high gravity
    world = wf.newWorld(0, 20000, false)

    -- Initialize the map
    loadMap('maps/Level1.lua')
    loadPlayer()
end

function love.update(dt)
    updatePlayer(dt)
    world:update(dt)
end

function love.draw()
    drawBeforePlayer()
    drawPlayer()
    drawMapLayers()
    world:draw()
end