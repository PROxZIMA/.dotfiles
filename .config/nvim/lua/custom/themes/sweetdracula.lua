local M = {}

M.base_30 = {
   white = "#F8F8F2",
   darker_black = "#161925",
   black = "#161925",
   black2 = "#11131c",
   one_bg = "#161925",
   one_bg2 = "#1C2031",
   one_bg3 = "#232735",

   grey = "#5e5f69",
   grey_fg = "#666771",
   grey_fg2 = "#6e6f79",
   light_grey = "#73747e",

   red = "#f38ba8",
   baby_pink = "#f2cdcd",
   pink = "#f5c2e7",
   line = "#3c3d49",
   green = "#a6e3a1",
   vibrant_green = "#5dff88",
   nord_blue = "#8b9bcd",
   blue = "#89b4fa",
   yellow = "#f9e2af",
   sun = "#FFFFA5",
   purple = "#cba6f7",
   dark_purple = "#cba6f7",
   teal = "#94e2d5",
   orange = "#fab387",
   cyan = "#89dceb",
   statusline_bg = "#191D2B",
   lightbg = "#41434f",
   pmenu_bg = "#cba6f7",
   folder_bg = "#a1b1e3",
}

M.base_16 = {
   base00 = "#161925",
   base01 = "#3a3c4e",
   base02 = "#4d4f68",
   base03 = "#626483",
   base04 = "#89b4fa",
   base05 = "#e9e9f4",
   base06 = "#f1f2f8",
   base07 = "#f7f7fb",
   base08 = "#cba6f7",
   base09 = "#fab387",
   base0A = "#89b4fa",
   base0B = "#F1FA8C",
   base0C = "#89dceb",
   base0D = "#a6e3a1",
   base0E = "#f5c2e7",
   base0F = "#F8F8F2",
}

M.polish_hl = {
  ["@function.builtin"] = { fg = M.base_30.cyan },
  ["@number"] = { fg = M.base_30.purple },
}

vim.opt.bg = "dark"

return M
