return {
    --Treesitter
    {
        -- Highlight, edit, and navigate code
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            'JoosepAlviste/nvim-ts-context-commentstring',
        },
        build = ":TSUpdate",
        config = function()
            -- [[ Configure Treesitter ]]
            -- See `:help nvim-treesitter`
            require("nvim-treesitter.configs").setup {
                -- Add languages to be installed here that you want installed for treesitter
                -- ensure_installed = { "c", "cpp", "go", "lua", "python", "rust", "typescript", "javascript",
                --     "vimdoc", "vim", "regex", "bash", "markdown", "markdown_inline" },
                ensure_installed = "all",

                modules = {},

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- List of parsers to ignore installing (or "all")
                ignore_install = {},

                -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
                auto_install = true,
                context_commentstring = {
                    enable = true,
                },

                highlight = { enable = true },
                indent = { enable = true },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<c-space>",
                        node_incremental = "<c-space>",
                        scope_incremental = "<c-s>",
                        node_decremental = "<M-space>",
                    },
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
                            ["aa"] = "@parameter.outer",
                            ["ia"] = "@parameter.inner",
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true, -- whether to set jumps in the jumplist
                        goto_next_start = {
                            ["]m"] = "@function.outer",
                            ["]]"] = "@class.outer",
                        },
                        goto_next_end = {
                            ["]M"] = "@function.outer",
                            ["]["] = "@class.outer",
                        },
                        goto_previous_start = {
                            ["[m"] = "@function.outer",
                            ["[["] = "@class.outer",
                        },
                        goto_previous_end = {
                            ["[M"] = "@function.outer",
                            ["[]"] = "@class.outer",
                        },
                    },
                    swap = {
                        enable = true,
                        swap_next = {
                            ["<leader>lpn"] = "@parameter.inner",
                        },
                        swap_previous = {
                            ["<leader>lpp"] = "@parameter.inner",
                        },
                    },
                },
                rainbow = {
                    enable = true,
                    extended_mode = false, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
                    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
                },
            }

            require('ts_context_commentstring').setup {}
        end,
    },
}
