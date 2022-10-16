M = {}
M.__index = M

function M.new(id, img, name)
  
  local self = setmetatable({
      
    }, M)

  return self
  
end

return M