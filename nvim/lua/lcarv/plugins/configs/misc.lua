return {
    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',



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
    { "mbbill/undotree" },
    { "nvim-lua/plenary.nvim", lazy = false, priority = 1000 },
    -- Changes bg of kitty to match nvim
    { "typicode/bg.nvim",      lazy = false, priority = 1000 },
    "LunarVim/Colorschemes",
    -- "jxnblk/vim-mdx-js"
}
