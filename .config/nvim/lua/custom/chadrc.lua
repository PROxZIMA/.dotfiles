-- First read our docs (completely) then check the example_config repo

-- local M = {}
--
-- M.ui = {
--   theme = "onedark",
-- }
--
-- return M
local M = {}

local override = require "custom.override"
local highlights = require "custom.highlights"

M.ui = {
    theme = "sweetdracula",
    theme_toggle = { "sweetdracula", "one_light" },
    hl_override = highlights,
    transparency = true
}

M.plugins = {
    remove = {
        "kyazdani42/nvim-tree.lua",
    },
    user = require "custom.plugins",
    override = {
        ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
        ["hrsh7th/nvim-cmp"] = override.nvimcmp,
        ["goolord/alpha-nvim"] = override.alphanvim,
        ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
        ["lukas-reineke/indent-blankline.nvim"] = override.blankline,
        ["NvChad/ui"] = override.chad_ui,
    },

    options = {
        lspconfig = {
            setup_lspconf = "custom.plugins.lspconfig",
        },
    },
}

M.mappings = require "custom.mappings"

return M
