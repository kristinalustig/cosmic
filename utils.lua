M = {}

function checkMouseOverlap(x, y, objX, objY, objW, objH)
  
  return x > objX and x < objX+objW and y > objY and y < objY + objH
  
end

return M