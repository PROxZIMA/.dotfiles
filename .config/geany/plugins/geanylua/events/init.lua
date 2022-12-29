-- load and initialize toggle_menu script
local lua_path = geany.appinfo().scriptdir..geany.dirsep

--[[
	start_action options:
		restore - startup with the last menu bar state
		*hide   - startup with menu bar hidden
		show    - startup with menu bar visible
		toggle  - startup with visibility toggled from the last menu bar state
--]]
start_action = "hide"

toggle_menu_bar = loadfile(lua_path.."toggle-menu-bar.lua")
toggle_menu_bar()
