return {
    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',

    -- LUALINE
    {
        -- Set lualine as statusline
        'nvim-lualine/lualine.nvim',
        -- See `:help lualine.txt`
        opts = {
            options = {
                icons_enabled = false,
                theme = 'catppuccin',
                component_separators = '|',
                section_separators = '',
            },
        },
    },


    -- Harpoon for navigation
    {
        "ThePrimeagen/harpoon",
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    -- Todo-comments
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {}
    },

    -- Undotree
    { "mbbill/undotree" },


    {
        "petertriho/nvim-scrollbar",
        opts = {}
    },

    {
        "jinh0/eyeliner.nvim",
        config = function()
            require("eyeliner").setup {
                highlight_on_key = true,
            }
        end,
    },
    {"mbbill/undotree"},
    {"nvim-lua/plenary.nvim"}
}
