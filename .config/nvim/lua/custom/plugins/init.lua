return {
    ["kyazdani42/nvim-tree.lua"] = {
        after = "base46",
        config = function()
            require "plugins.configs.nvimtree"
        end
    },

    ["goolord/alpha-nvim"] = {
        disable = false
    },

    -- autoclose tags in html, jsx etc
    ["windwp/nvim-ts-autotag"] = {
        ft = { "html", "javascriptreact" },
        after = "nvim-treesitter",
        config = function()
            require("custom.plugins.smolconfigs").autotag()
        end,
    },

    -- format & linting
    ["jose-elias-alvarez/null-ls.nvim"] = {
        after = "nvim-lspconfig",
        config = function()
            require "custom.plugins.null-ls"
        end,
    },

    -- dim inactive windows
    ["andreadev-it/shade.nvim"] = {
        module = "shade",
        config = function()
            require("custom.plugins.smolconfigs").shade()
        end,
    },

    -- tabbar
    ["akinsho/bufferline.nvim"] = {
        after = "alpha-nvim",
        config = function()
            require "custom.plugins.bufferline"
        end,
    },

    ["Pocco81/AutoSave.nvim"] = {
        module = "autosave",
        config = function()
            require("custom.plugins.smolconfigs").autosave()
        end,
    },
}
