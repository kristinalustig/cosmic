local scene = require "scene"
local gs = require "gameState"
local sc = require "sceneContents"

lg = love.graphics

GlobalScenes = {}
CurrentScene = nil

function love.load()
  
  scene.loadAssets() --get those images
  sc.loadAssets() --get object images!
  sc.initializeObjects() --get those objects ready w all the data
  scene.initializeScenes() --create scenes and then populate them into GlobalScenes
  
  CurrentScene = scene.getSceneByName("ShackExt") --easy shortcuts!

  
end

function love.update(dt)
  
  
  
end

function love.draw()
  
  scene.draw(CurrentScene)
  
end

function love.keyreleased(key, scancode)
  
  if key == "n" then
    CurrentScene = scene.getSceneByName("Notebook")
  elseif key == "escape" then
    CurrentScene = scene.getSceneByName("Pause")
  elseif key == "m" then
    CurrentScene = scene.getSceneByName("Overworld")
  end
  
end

function love.mousepressed(x, y, button, istouch, presses)
  local clickTarget
  
  clickTarget = scene.checkClickLocation(x, y)
  
  if clickTarget ~= nil then
    clickTarget.doAction()
  end
  
end

