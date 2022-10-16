M = {}
M.__index = M

local bed
local table
local foodOnTable
local spellbook
local historyBook
local journal
local mouseHole
local backRoomWindow
local woodStove
local storageChest
local clothesBox
local pillow
local chamberPot
local shavingStand
local mirror
local framedPicture
local rug
local dogBowls
local coat
local boots
local keys
local boxes

function new(id, img, name, canInventory, comment, inScene, doAction, zIndex, x, y)
  
  local self = setmetatable({
      
      id = id, --num
      img = img, --love.image
      name = name, --str
      canInventory = canInventory or false, --bool
      wasDiscovered = false, --bool
      comment = comment, --str
      inScene = inScene, --num (sceneId)
      isVisible = isVisible or false,
      doAction = doAction or nil, --func
      zIndex = zIndex, --num
      x = x, --num
      y = y --num
      
    }, M)

  return self
  
end

function M.loadAssets()
  
  
  
end

function M.initializeObjects()
  
  --id, image, name, canInventory, comment, inScene, doAction, zIndex, x, y
  
  
end

function M.getSceneContents(s)
  local sc = {}
  
  
end

function M.draw(s)
  
end

return M