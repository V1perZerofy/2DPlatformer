local mapName = ""
function loadMap(pMapName)
    mapName = pMapName
    gameMap = sti('maps/Level1.lua')
    loadWalls()
end

function loadWalls()
    if gameMap.layers["Platforms"] then
        for i, obj in pairs(gameMap.layers["Platforms"].objects) do
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
function drawBeforePlayer()
    if gameMap.layers["Background"] then
        gameMap:drawLayer(gameMap.layers["Background"])
    end
end

function drawMapLayers()
    gameMap:drawLayer(gameMap.layers["Foreground1"])
    gameMap:drawLayer(gameMap.layers["Foreground2"])
end