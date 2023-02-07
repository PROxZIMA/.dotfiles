math.randomseed(os.time()) -- For random header.

Headers = require "custom.headers"

local pick_color = function()
    local colors = {"String", "Identifier", "Keyword", "Number", "Null"}
    return colors[math.random(#colors)]
end

local M = {}

lspkind = {
    Variable = " ",
    Class = " ",
    Property = " ",
    Keyword = " ",
    Reference = " ",
    Array = " ",
    String = " ",
}

M.alphanvim = {
    header = {
        val = Headers[15],
        opts = {
            hl = pick_color(),
        },
    },
}

M.nvimcmp = {
    formatting = {
        format = function(_, vim_item)
            local icons = vim.tbl_deep_extend("force", require("nvchad_ui.icons").lspkind, lspkind)
            vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
            return vim_item
        end,
    },
}

M.treesitter = {
    ensure_installed = {
        "vim",
        "html",
        "css",
        "javascript",
        "json",
        "toml",
        "markdown",
        "c",
        "bash",
        "lua",
    },
}

M.nvimtree = {
    open_on_setup = true,
    open_on_tab = false,
    ignore_buffer_on_setup = true,
    git = {
        enable = true,
        ignore = false,
    },
    view = {
        adaptive_size = false,
        hide_root_folder = false,
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
                folder_arrow = false,
            },
        },
    },
}

M.blankline = {
    filetype_exclude = {
        "help",
        "terminal",
        "alpha",
        "packer",
        "lspinfo",
        "TelescopePrompt",
        "TelescopeResults",
        "nvchad_cheatsheet",
        "lsp-installer",
        "norg",
        "",
    },
}

M.chad_ui =  {
    statusline = {
        separator_style = {
            left = " ",
            right = " ",
        },
        overriden_modules = function()
            return require "custom.plugins.statusline"
        end,
    },
    tabufline = {
        enabled = false,
        lazyload = false,
    }
}

return M
