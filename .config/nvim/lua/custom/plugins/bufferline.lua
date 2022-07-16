local present, bufferline = pcall(require, "bufferline")
local colors = require("base46").get_theme_tb "base_30"

if not present then
    return
end

bufferline.setup {
    options = {
        themable = true,
        close_command = "bp|sp|bn|bd%d",
        right_mouse_command = "vertical sbuffer %d",
        middle_mouse_command = "bp|sp|bn|bd%d",
        diagnostics = "nvim_lsp",
        offsets = {
            {
                filetype = "NvimTree",
                text = "",
                highlight = "Directory",
                text_align = "center"
            }
        },
        separator_style = "thin",
        custom_areas = {
            right = function()
                return {{
                    text = "%@TbToggle_theme@%#BufferLineCloseButton#" .. vim.g.toggle_theme_icon .. "%X"
                }}
            end,
        },
    },
    highlights = {
        fill = {
            guibg = colors.black,
        },
        buffer_selected = {
            gui = "bold,italic"
        },
    },
}
