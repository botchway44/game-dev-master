require "./headers/fighter"
require "./fighters/liu_kang"

mode = "stance"

function love.load()
  liu_kang:init()
end

function love.draw()
  liu_kang:show()
  
end

--[key pressed functions to instantiate the movement and ducking]
function love.keypressed(key)
  
    --key pressed equals right
    if key == 'right' then
     mode = "walking"
    end
    
    if key == 'up' then
     mode = "ducking"
    end
    
     if key == 'space' then
     mode = "forwardJumping"
      end
  
  end
function love.update(dt)
  --change the spriteSheetName argument to one of ff. to view its animation
  --"stance", "walking", "ducking", "forwardJumping"
 
  liu_kang:animate(mode, dt) --signature: Fighter:animate(spriteSheetName, dt)
end

--NB: gif folders are still present because we need to finish converting every gif image to png before deletion
--    LOVE does not support gif
--    So, at the moment, they are only wasting storage space.