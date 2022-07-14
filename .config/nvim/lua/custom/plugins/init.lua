return {
    ["kyazdani42/nvim-tree.lua"] = {
        after = "base46",
        config = function()
            require "plugins.configs.nvimtree"
        end
    },
    ["goolord/alpha-nvim"] = {
        after = "base46",
        disable = false,
        config = function()
           require "plugins.configs.alpha"
        end
    },
    ["neovim/nvim-lspconfig"] = {
        after = "nvim-lsp-installer",
        module = "lspconfig",
        config = function()
            require "plugins.configs.lsp_installer"
            require "plugins.configs.lspconfig"
            require "custom.plugins.lspconfig"
        end
    }
}
