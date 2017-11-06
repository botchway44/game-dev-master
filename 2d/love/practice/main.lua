-- OUR FUNNY LOOKING PLAYER OBJECT :)

player = {
    position = { x = 0, y = 0},
    size = { width = 0,  height = 0},
    isMovingRight = true
}

function love.load()
  love.graphics.setBackgroundColor(255,255,255,255)
  local windowCenterPosition = { x = love.graphics.getWidth()/2, y = love.graphics.getHeight()/2}
  player.position = windowCenterPosition;
  player.size.width = 300
  player.size.height = 500
end

function love.draw()
  drawPlayer()
end

-- how the dt(delta time) argument works
-- dt is the amount of time in sec passed
-- This allows a consistent behaviour across different pcs of different performance when moving abjects
-- HOW?
--  the number of frames a pc can display in a second is always spaced out evenly inside a second
--  So, the Love.update(dt) will be called at the specified interval
--  eg. there are 3 pcs, pc1, pc2, pc3
--      pc1frames = 4, interval = 0.25s
--      pc2frames = 10, interval = 0.1s
--      pc3frames = 20, interval = 0.05s
--      but the more the frames, the smoother our eyes perceive the movement to be
--      So if a graphics object (gObj) is to be moved from a point (0,0) to point (500,0) on the screen,
--      the movement will be observed on
--      pc2 as: ( 0s, gObj at (0,0) ) --> ( 0.25s, gObj at ( 0.25 * 500, 0) --> (0.5s, gObj at ( 0.5 * 500, 0) and so on
--      this logic will work for the other pcs too
--      By the end of a second, the gObj will have moved to point (500,0) on all pcs
-- This explains code like: gObj.position.x = gObj.position.x + (dt * 500)
function love.update(dt)
  if(player.isMovingRight) then
    movePlayerHorz(100, dt)
  else
    movePlayerHorz(-100, dt)
  end
  
  local playerRightPosBoundary = love.graphics.getWidth() - (player.size.width * 0.5)
  local playerLeftPosBoundary = player.size.width * 0.5
  if(player.position.x > playerRightPosBoundary) then
    player.isMovingRight = false
  elseif (player.position.x < playerLeftPosBoundary) then
    player.isMovingRight = true
  end
end

function drawPlayer()
  love.graphics.setColor(100, 10, 90, 200)
  love.graphics.polygon("fill", getPlayerPolygonData())
  
end

-- where makeRelativePoint() can be used to create points around players center
function getPlayerPolygonData()
  x1,y1 = makeRelativePoint(-0.25 * (player.size.width * 0.5), -1 * (player.size.height * 0.5))
  x2,y2 = makeRelativePoint( 0.25 * (player.size.width * 0.5), -1 * (player.size.height * 0.5))
  x3,y3 = makeRelativePoint(player.size.width * 0.5, player.size.height * 0.5)
  x4,y4 = makeRelativePoint(-1 * (player.size.width * 0.5),player.size.height * 0.5)

  return {x1,y1,x2,y2,x3,y3,x4,y4}
end

-- THE FUNCTION WE MIGHT WANT TO KEEP AND IMPROVE --
function makeRelativePoint(x,y)
  local newXPos = player.position.x + x;
  local newYPos = player.position.y + y;
  if(newXPos > love.graphics.getWidth()) or (newYPos > love.graphics.getHeight()) then
      return nil
  end
  
  return newXPos,newYPos
end

-- NB: moving a player is now simplified. We only add a value to its current position
-- Before, adding the value to all points forming the player would be necessary to move the whole body at once
function movePlayerHorz(dt, s) -- s is the horizontal distance to be moved
  newPlayerPosition = player.position.x + (s*dt)
  player.position.x = newPlayerPosition
end


function drawPlayerArms()
  love.graphics.setColor(210,80,90,240)
end