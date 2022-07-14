math.randomseed(os.time()) -- For random header.

vim.cmd("cd " .. vim.fn.expand("%:p:h"))
vim.o.guifont = "FiraCode Nerd Font,Operator Mono SSm Lig Book,FiraCode Nerd Font,Hack Nerd Font Mono,JetBrainsMono Nerd Font,codicon:h11"

vim.api.nvim_create_user_command("Config", [[edit $MYVIMRC]], {})
vim.api.nvim_create_user_command("ConfigReload", require "custom.plugins.reload", {})

Headers = require "custom.plugins.headers"

local pick_color = function()
    local colors = {"String", "Identifier", "Keyword", "Number", "Null"}
    return colors[math.random(#colors)]
end

local M = {}

M.ui = {
    theme = "onedark",
    statusline = {
        override = require "custom.plugins.statusline"
    },
}

M.lspkind = {
    Variable = " ",
    Class = " ",
    Property = " ",
    Keyword = " ",
    Reference = " ",
    Array = " ",
    String = " ",
}

M.plugins = {
    remove = {
        "kyazdani42/nvim-tree.lua",
    },
    user = require "custom.plugins",
    override = {
        ["kyazdani42/nvim-tree.lua"] = {
            open_on_setup = true,
            open_on_tab = false,
            ignore_buffer_on_setup = true,
            git = {
                enable = true,
                ignore = false
            },
            actions = {
                open_file = {
                    resize_window = false,
                },
            },
            renderer = {
                highlight_git = true,
                icons = {
                    show = {
                        folder_arrow = false
                    }
                },
            },
        },
        ["hrsh7th/nvim-cmp"] = {
            formatting = {
                format = function(_, vim_item)
                    local icons = vim.tbl_deep_extend("force", require("ui.icons").lspkind, M.lspkind)
                    vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
                    return vim_item
                end,
            },
        },
        ["goolord/alpha-nvim"] = {
            header = {
                val = Headers[math.random(#Headers)],
                opts = {
                    hl = pick_color(),
                },
            }
        }
    }
}

if vim.fn.exists("vim.g.neovide") then
    vim.g.neovide_transparency=1
    vim.g.neovide_floating_blur_amount_x=2.0
    vim.g.neovide_floating_blur_amount_y=2.0
    vim.g.neovide_remember_window_size=true
    vim.g.neovide_cursor_vfx_mode = "pixiedust"
    vim.g.neovide_cursor_vfx_opacity=200.0
    vim.g.neovide_cursor_vfx_particle_lifetime=1.2
    vim.g.neovide_cursor_vfx_particle_density=10.0
    vim.g.neovide_cursor_vfx_particle_speed=10.0
end

local modifiedBufs = function(bufs)
    local t = 0
    for k,v in pairs(bufs) do
        if v.name:match("NvimTree_") == nil then
            t = t + 1
        end
    end
    return t
end

vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        if #vim.api.nvim_list_wins() == 1 and
        vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil and
        modifiedBufs(vim.fn.getbufinfo({bufmodified = 1})) == 0 then
            vim.cmd "quit"
        end
    end
})

return M
