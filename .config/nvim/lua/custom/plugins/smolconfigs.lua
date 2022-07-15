local M = {}

M.autotag = function()
    local present, autotag = pcall(require, "nvim-ts-autotag")

    if present then
        autotag.setup()
    end
end

M.shade = function()
    local present, shade = pcall(require, "shade")

    if not present then
        return
    end

    shade.setup {
        overlay_opacity = 50,
        opacity_step = 1,
        exclude_filetypes = { "NvimTree" },
    }
end

M.autosave = function()
    local present, autosave = pcall(require, "autosave")

    if present then
        autosave.setup()
    end
end

M.bufferline = function()
    local present, bufferline = pcall(require, "bufferline")

    if not present then
        return
    end

    bufferline.setup {
        options = {
            right_mouse_command = "vertical sbuffer %d",
            middle_mouse_command = "",
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
        }
    }
end

return M
