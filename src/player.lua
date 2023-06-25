function loadPlayer()
    player = {}
    player.collider = world:newBSGRectangleCollider(32, 200, 32, 32, 1)
    player.collider:setFixedRotation(true)
    player.collider:setType("dynamic")
    player.x = 200
    player.y = 200
    player.speed = 300
    player.health = 3
    player.maxHealth = 3
    player.isAlive = true
    player.spriteSheet = love.graphics.newImage('sprites/SpriteSheet.png')
    player.grid = anim8.newGrid(32, 32, player.spriteSheet:getWidth(), player.spriteSheet:getHeight())

    player.animations = {}
    player.animations.left = anim8.newAnimation(player.grid('1-4', 1), 0.13)

    player.animations.leftFlipped = player.animations.left:clone():flipH()

    player.anim = player.animations.left
end


function updatePlayer(dt)
    local isMoving = false
    local vx = 0
    local vy = -200

    if love.keyboard.isDown("a") then
        vx = -player.speed
        player.anim = player.animations.leftFlipped
        isMoving = true
    end
    if love.keyboard.isDown("d") then
        vx = player.speed
        player.anim = player.animations.left
        isMoving = true
    end
    if love.keyboard.isDown("w") then
        player.collider:setLinearVelocity(0, vy)
    end

    player.collider:setLinearVelocity(vx, 0)
    

    if not isMoving then
        player.anim:gotoFrame(2)
    end

    player.x = player.collider:getX() - 16
    player.y = player.collider:getY() - 16

    player.anim:update(dt)
end


function drawPlayer()
    player.anim:draw(player.spriteSheet, player.x, player.y)
    --addHeart(64, 64)
end