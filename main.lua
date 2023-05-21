function love.load()
    love.window.setMode(20 * 16, 20 * 16)
    camera = require('libraries/camera')
    anim8 = require('libraries/anim8')
    love.graphics.setDefaultFilter("nearest", "nearest")
    sti = require('libraries/sti')
    wf = require('libraries/windfield')

    require('src/map')

    -- Initialize the world
    world = wf.newWorld(0, 9.81)

    -- Initialize the map
    loadMap()
end

function love.update(dt)
    world:update(dt)
end

function love.draw()
    drawMapLayers()
end