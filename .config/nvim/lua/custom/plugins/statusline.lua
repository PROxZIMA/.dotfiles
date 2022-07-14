local st_modules = require "ui.statusline.modules"

local sep_style = require("ui.icons").statusline_separators
local default_sep = require("core.default_config").ui.statusline.separator_style
local sepo_l = sep_style[default_sep]["left"]
local sepo_r = sep_style[default_sep]["right"]

new_sep_style = {
    left = " ",
    right = "  ",
}

local sep_l = new_sep_style["left"]
local sep_r = new_sep_style["right"]

local M = {}

M.mode = function()
   return st_modules.mode():gsub("", ""):gsub(sepo_r, sep_r)
end

M.fileInfo = function()
   return st_modules.fileInfo():gsub(sepo_r, sep_r)
end

M.cwd = function()
   return st_modules.cwd():gsub("", " "):gsub(sepo_l, sep_l)
end

M.cursor_position = function()
   return st_modules.cursor_position():gsub("", " "):gsub(sepo_l, sep_l)
end

return M
