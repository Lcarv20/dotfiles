return {
    -- Git related plugins
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
    {
        -- Adds git releated signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        opts = {
            -- See `:help gitsigns.txt`
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
            on_attach = function(bufnr)
                vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk,
                    { buffer = bufnr, desc = 'go to [P]revious Hunk' })
                vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk,
                    { buffer = bufnr, desc = 'go to [N]ext Hunk' })
                vim.keymap.set('n', '<leader>gh', require('gitsigns').preview_hunk,
                    { buffer = bufnr, desc = 'preview [H]unk' })
            end,
        },
    },

    { "NeogitOrg/neogit", dependencies = "nvim-lua/plenary.nvim", config = true },
    "sindrets/diffview.nvim",


}
