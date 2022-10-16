local sc = require "sceneContents"
local utils = require "utils"

M = {}
M.__index = M

--background images
local shackExteriorImg
local shackRoom1BackImg
local shackRoom1FrontImg
local shackRoom2BackImg
local shackRoom2FrontImg
local shackBasementImg
local libraryExteriorImg
local libraryInteriorImg
local shopExteriorImg
local shopInteriorImg
local universityExteriorImg
local universityInteriorImg
local overworldImg
local titleScreenImg
local notebookImg
local gameOverImg
local pauseMenuImg

local function loadContents(self)
  
  self.contents = sc.getSceneContents(self)
  
end

local function new(name, id, img)
  
  local self = setmetatable({
      
      name = name,
      id = id,
      img = img
      
    }, M)

  loadContents(self)

  return self
  
end

function M.loadAssets()
  
  shackExteriorImg = love.graphics.newImage("assets/sceneBackgrounds/shack-exterior.png")
  shackRoom1BackImg = love.graphics.newImage("assets/sceneBackgrounds/shack-room1-back.png")
  shackRoom1FrontImg = love.graphics.newImage("assets/sceneBackgrounds/shack-room1-front.png")
  shackRoom2BackImg = love.graphics.newImage("assets/sceneBackgrounds/shack-room2-back.png")
  shackRoom2FrontImg = love.graphics.newImage("assets/sceneBackgrounds/shack-room2-front.png")
  shackBasementImg = love.graphics.newImage("assets/sceneBackgrounds/shack-basement.png")
  libraryExteriorImg = love.graphics.newImage("assets/sceneBackgrounds/library-exterior.png")
  libraryInteriorImg = love.graphics.newImage("assets/sceneBackgrounds/library-interior.png")
  shopExteriorImg = love.graphics.newImage("assets/sceneBackgrounds/shop-exterior.png")
  shopInteriorImg = love.graphics.newImage("assets/sceneBackgrounds/shop-interior.png")
  universityExteriorImg = love.graphics.newImage("assets/sceneBackgrounds/uni-exterior.png")
  universityInteriorImg = love.graphics.newImage("assets/sceneBackgrounds/uni-interior.png")
  overworldImg = love.graphics.newImage("assets/sceneBackgrounds/overworld.png")
  titleScreenImg = love.graphics.newImage("assets/sceneBackgrounds/title.png")
  notebookImg = love.graphics.newImage("assets/sceneBackgrounds/notebook.png")
  gameOverImg = love.graphics.newImage("assets/sceneBackgrounds/game-over.png")
  pauseMenuImg = love.graphics.newImage("assets/sceneBackgrounds/pause.png")
  
end

function M.initializeScenes()
  
  --utility scenes 1-9
  table.insert(GlobalScenes, new("TitleScreen", 1, titleScreenImg))
  table.insert(GlobalScenes, new("Pause", 2, pauseMenuImg))
  table.insert(GlobalScenes, new("Notebook", 3, notebookImg))
  table.insert(GlobalScenes, new("Overworld", 4, overworldImg))
  table.insert(GlobalScenes, new("GameOver", 5, gameOverImg))
  
  --shack -10-19
  table.insert(GlobalScenes, new("ShackExt", 10, shackExteriorImg))
  table.insert(GlobalScenes, new("ShackRoom1Front", 11, shackRoom1FrontImg))
  table.insert(GlobalScenes, new("ShackRoom1Back", 12, shackRoom1BackImg))
  table.insert(GlobalScenes, new("ShackRoom2Front", 13, shackRoom2FrontImg))
  table.insert(GlobalScenes, new("ShackRoom2Back", 14, shackRoom2BackImg))
  table.insert(GlobalScenes, new("ShackBasement", 15, shackBasementImg))
  
  -- library 20-29
  table.insert(GlobalScenes, new("LibraryExt", 20, libraryExteriorImg))
  table.insert(GlobalScenes, new("LibraryInt", 21, libraryInteriorImg))
  
  -- shop 30-39
  table.insert(GlobalScenes, new("ShopExt", 30, shopExteriorImg))
  table.insert(GlobalScenes, new("ShopInt", 31, shopInteriorImg))
  
  -- uni 40-49
  table.insert(GlobalScenes, new("UniExt", 40, universityExteriorImg))
  table.insert(GlobalScenes, new("UniInt", 41, universityInteriorImg))
  
end

function M.draw(s)
  
  lg.draw(s.img, 0, 0)
  lg.printf(s.name, 300, 300, 300, "center")
  sc.draw(s)
  
end

function M.checkClickLocation(x, y)
  
  if CurrentScene.contents ~= nil then
    for k, v in ipairs(CurrentScene.contents) do
      if utils.checkMouseOverlap(x, y, v.x, v.y, v.img:getWidth(), v.img:getHeight()) then
        return v
      end
    end
  end
  
  return nil
  
end

function M.getSceneById(id)
  for k, v in ipairs(GlobalScenes) do
    if v.id == id then
      return v
    end
  end
  
end

function M.getSceneByName(name)
  for k, v in ipairs(GlobalScenes) do
    if v.name == name then
      return v
    end
  end
  
end


return M