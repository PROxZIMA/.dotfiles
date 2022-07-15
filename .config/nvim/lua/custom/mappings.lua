local M = {}

M.treesitter = {
    n = {
        ["<leader>cu"] = { "<cmd> TSCaptureUnderCursor <CR>", "  find media" },
    },
}

M.shade = {
    n = {
        ["<leader>s"] = {
            function()
                require("shade").toggle()
            end,

            "   toggle shade.nvim",
        },
    },
}

return M
