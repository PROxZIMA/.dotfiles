local M = {}

local override = require "custom.override"

-- M.ui = {
--     theme = "onedark",
--     -- hl_add = require "custom.highlights",
-- }

M.plugins = {
    remove = {
        "kyazdani42/nvim-tree.lua",
    },
    user = require "custom.plugins",
    override = {
        ["NvChad/ui"] = override.chadui,
        ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
        -- ["hrsh7th/nvim-cmp"] = override.nvimcmp,
        ["goolord/alpha-nvim"] = override.alphanvim,
        ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
        ["lukas-reineke/indent-blankline.nvim"] = override.blankline,
    },

    options = {
        lspconfig = {
            setup_lspconf = "custom.plugins.lspconfig",
        },
    },
}

M.mappings = require "custom.mappings"

return M
