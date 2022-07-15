local st_modules = require "nvchad_ui.statusline.modules"

local M = {}

M.mode = function()
   return st_modules.mode():gsub("", "")
end

M.cwd = function()
   return st_modules.cwd():gsub("", " ")
end

M.cursor_position = function()
   return st_modules.cursor_position():gsub("", " ")
end

return M
