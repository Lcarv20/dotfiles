local icons = require('lcarv.icons')
return {
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
            return vim.fn.executable 'make' == 1
        end,
    },
    -- Fuzzy Finder (files, lsp, etc)
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            -- [[ Configure Telescope ]]
            -- See `:help telescope` and `:help telescope.setup()`
            local telescope = require('telescope')
            telescope.setup {
                defaults = {
                    prompt_prefix = " " .. icons.ui.Search .. " ",
                    borderchars = {
                        prompt = { ' ', ' ', '⎯', ' ', ' ', ' ', ' ', ' ' },
                        results = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
                        preview = { ' ', ' ', ' ', '▏', '▏', ' ', ' ', '▏' },
                    },
                    sorting_strategy = "ascending", -- display results top->bottom
                    layout_config = {
                        prompt_position = "top"     -- search bar at the top
                    },
                    mappings = {
                        i = {
                            ['<C-u>'] = false,
                            ['<C-d>'] = false,
                        },
                    },
                },
            }

            -- Enable telescope fzf native, if installed
            telescope.load_extension('fzf')
            -- Enable notify.nvim
            -- telescope.load_extension("notify")
        end
    },
}
