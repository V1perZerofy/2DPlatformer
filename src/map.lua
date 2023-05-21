function loadMap()
    gameMap = sti('maps/Level1.lua')
    loadWalls()
end

function loadWalls()
    if gameMap.layers["Walls"] then
        for i, obj in pairs(gameMap.layers["Walls"].objects) do
            local wall
            if obj.shape == "rectangle" then
                wall = world:newRectangleCollider(obj.x, obj.y, obj.width, obj.height)
            elseif obj.shape == "polygon" then
                local vertices = {}
                for j, vertex in ipairs(obj.polygon) do
                    table.insert(vertices, vertex.x)
                    table.insert(vertices, vertex.y)
                end
                wall = world:newPolygonCollider(vertices)
            end
            if wall then
                wall:setType('static')
            end
        end
    end
end

function drawMapLayers()
    love.graphics.setBackgroundColor(1,1,0)
    gameMap:drawLayer(gameMap.layers["Background"])
    gameMap:drawLayer(gameMap.layers["Water"])
    gameMap:drawLayer(gameMap.layers["Foreground"])
end