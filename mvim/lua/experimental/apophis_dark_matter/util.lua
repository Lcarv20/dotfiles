-- lua/apophis_dark_matter/util.lua
local M = {}

--- Removes the alpha component from an 8-digit hex color string (#RRGGBBAA -> #RRGGBB)
---@param hex_color string The hex color string (e.g., #RRGGBBAA or #RRGGBB)
---@return string The hex color string without alpha (#RRGGBB)
function M.remove_alpha(hex_color)
  if type(hex_color) == "string" and hex_color:len() == 9 and hex_color:sub(1, 1) == '#' then
    return hex_color:sub(1, 7) -- Extract the first 7 characters (#RRGGBB)
  else
    return hex_color -- Return original if not a 9-character hex code or not a string
  end
end

return M