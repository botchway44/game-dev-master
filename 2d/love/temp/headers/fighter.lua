MoveDirection = { LEFT = -1, RIGHT = 1 }

Fighter = {
    position = {x = 0,y = 0},
    size = {w,h},
    defaultSprite = nil,
    currentSprite = nil,
    spriteSheets = {
        stance = {},
        walking = {},
        ducking = {},
        forwardJumping = {}
    },
    activeAnimSpriteNumber = 1,
    animationSpeed = 5,
    animationTimeElapsed = 0,
    isAnimated = false,
    moveDirection = MoveDirection.RIGHT
}

function Fighter:getPosition()
    return self.position.x, self.position.y
end

function Fighter:show()
  love.graphics.points(self.position)
  love.graphics.draw(
    self.currentSprite, 
    ({Fighter:getPosition()})[1] - (self.currentSprite:getWidth() * 0.5),
    ({Fighter:getPosition()})[2] - (self.currentSprite:getHeight() * 0.5)
  )
end

function Fighter:animate(spriteSheetName, dt)
  self.animationTimeElapsed = self.animationTimeElapsed + dt
  if(self.animationTimeElapsed > 1 * (0.018 * self.animationSpeed)) then
    --print("elapsed time: " .. tostring(self.animationTimeElapsed ))
    --print("active sprite number: " .. self.activeAnimSpriteNumber)
    self.activeAnimSpriteNumber = self.activeAnimSpriteNumber + 1
    if(self.activeAnimSpriteNumber > (self.spriteSheets[spriteSheetName]).size) then
      self.activeAnimSpriteNumber = 1
    end
    self.currentAnimSprite = (self.spriteSheets[spriteSheetName])[self.activeAnimSpriteNumber]
    self.currentSprite = self.currentAnimSprite
    --print("changing sprite to "..tostring(self.currentAnimSprite))
    self.animationTimeElapsed = 0
  end
  love.graphics.print(tostring(self.animationTimeElapsed))
end 