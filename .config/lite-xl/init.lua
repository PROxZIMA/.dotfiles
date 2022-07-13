-- put user settings here
-- this module will be loaded after everything else when the application starts
-- it will be automatically reloaded when saved

local core = require "core"
local keymap = require "core.keymap"
local config = require "core.config"
local style = require "core.style"

config.max_tabs = 10
config.indent_size = 4
config.blink_period = 1
config.borderless = true
config.line_limit = 10000
config.ignore_files = "?"
------------------------------ Themes ----------------------------------------

-- light theme:
core.reload_module("colors.dracula")

--------------------------- Key bindings -------------------------------------

-- key binding:
-- keymap.add { ["ctrl+escape"] = "core:quit" }


------------------------------- Fonts ----------------------------------------

-- customize fonts:
style.font = renderer.font.load(DATADIR .. "/fonts/FiraSans-Regular.ttf", 14 * SCALE)
style.code_font = renderer.font.load(DATADIR .. "/fonts/JetBrainsMono-Regular.ttf", 14 * SCALE)
style.icon_font = renderer.font.load(DATADIR .. "/fonts/icons.ttf", 14 * SCALE)
--
-- font names used by lite:
-- style.font          : user interface
-- style.big_font      : big text in welcome screen
-- style.icon_font     : icons
-- style.icon_big_font : toolbar icons
-- style.code_font     : code
--
-- the function to load the font accept a 3rd optional argument like:
--
-- {antialiasing="grayscale", hinting="full"}
--
-- possible values are:
-- antialiasing: grayscale, subpixel
-- hinting: none, slight, full

------------------------------ Plugins ----------------------------------------

-- enable or disable plugin loading setting config entries:

config.plugins.autosave = false
config.plugins.centerdoc = false
config.plugins.eval = false
config.plugins.exec = false
config.plugins.force_syntax = false
config.plugins.hidelinenumbers = false
config.plugins.hidestatus = false
config.plugins.linecopypaste = false
config.plugins.linenumbers = false
config.plugins.macmodkeys = false
config.plugins.minimap = false
config.plugins.opacity = false
config.plugins.openfilelocation = false
config.plugins.select_colorscheme = false
config.plugins.smallclock = false
config.plugins.sort = false
config.plugins.statusclock = false
config.plugins.themeselect = false
config.plugins.texcompile = false
config.plugins.unboundedscroll = false


local conf = config.plugins.equationgrapher
conf.point_size = 3
conf.steps = 100
