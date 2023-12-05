--------------
--LSP
--------------
return {
    {
        "neovim/nvim-lspconfig",
        -- opts = {
        --     inlay_hints = { enabled = true },
        -- },
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            { "williamboman/mason.nvim", config = true },
            "williamboman/mason-lspconfig.nvim",

            -- Useful status updates for LSP
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            -- { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

            -- Additional lua configuration, makes nvim stuff amazing!
            "folke/neodev.nvim",
        },
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {
            handler_opts = {
                -- border = "rounded"
            },
            floating_window = false,
            hint_enable = true,
        },
        config = function(_, opts)
            require("lsp_signature").setup(opts)
        end,
    },
    -- {
    --     "lvimuser/lsp-inlayhints.nvim",
    --     opts = {}
    -- }
}
