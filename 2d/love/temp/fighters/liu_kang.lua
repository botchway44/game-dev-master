require "./headers/universal"

liu_kang = Fighter

function liu_kang:init()
  liu_kang.position = windowCenterPos
  liu_kang.defaultSprite = love.graphics.newImage("assets/sprites/liu_kang/png/stance/01.png")
  liu_kang.currentSprite = liu_kang.defaultSprite
  
  liu_kang.spriteSheets.stance = { 
    love.graphics.newImage("assets/sprites/liu_kang/png/stance/01.png"),
    love.graphics.newImage("assets/sprites/liu_kang/png/stance/02.png"),
    love.graphics.newImage("assets/sprites/liu_kang/png/stance/03.png"),
    love.graphics.newImage("assets/sprites/liu_kang/png/stance/04.png"),
    love.graphics.newImage("assets/sprites/liu_kang/png/stance/05.png"),
    love.graphics.newImage("assets/sprites/liu_kang/png/stance/06.png"),
    love.graphics.newImage("assets/sprites/liu_kang/png/stance/07.png"),
    love.graphics.newImage("assets/sprites/liu_kang/png/stance/08.png"),
    size = 8
  }

  liu_kang.spriteSheets.walking = { 
      love.graphics.newImage("assets/sprites/liu_kang/png/walking/01.png"),
      love.graphics.newImage("assets/sprites/liu_kang/png/walking/02.png"),
      love.graphics.newImage("assets/sprites/liu_kang/png/walking/03.png"),
      love.graphics.newImage("assets/sprites/liu_kang/png/walking/04.png"),
      love.graphics.newImage("assets/sprites/liu_kang/png/walking/05.png"),
      love.graphics.newImage("assets/sprites/liu_kang/png/walking/06.png"),
      love.graphics.newImage("assets/sprites/liu_kang/png/walking/07.png"),
      love.graphics.newImage("assets/sprites/liu_kang/png/walking/08.png"),
      love.graphics.newImage("assets/sprites/liu_kang/png/walking/09.png"),
      size = 9
  }

  liu_kang.spriteSheets.ducking = {
    love.graphics.newImage("assets/sprites/liu_kang/png/ducking_and_jumping/d01.png"),
    love.graphics.newImage("assets/sprites/liu_kang/png/ducking_and_jumping/d02.png"),
    love.graphics.newImage("assets/sprites/liu_kang/png/ducking_and_jumping/d03.png"),
    size = 3
  }

  liu_kang.spriteSheets.forwardJumping = {
    love.graphics.newImage("assets/sprites/liu_kang/png/ducking_and_jumping/f01.png"),
    love.graphics.newImage("assets/sprites/liu_kang/png/ducking_and_jumping/f02.png"),
    love.graphics.newImage("assets/sprites/liu_kang/png/ducking_and_jumping/f03.png"),
    love.graphics.newImage("assets/sprites/liu_kang/png/ducking_and_jumping/f04.png"),
    love.graphics.newImage("assets/sprites/liu_kang/png/ducking_and_jumping/f05.png"),
    love.graphics.newImage("assets/sprites/liu_kang/png/ducking_and_jumping/f06.png"),
    love.graphics.newImage("assets/sprites/liu_kang/png/ducking_and_jumping/f07.png"),
    love.graphics.newImage("assets/sprites/liu_kang/png/ducking_and_jumping/f08.png"),
    size = 8
  }
end