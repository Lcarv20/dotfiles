return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects", event = "VeryLazy" },
      {
        "nvim-treesitter/nvim-treesitter-context",
        enabled = false,
        event = "VeryLazy",
        config = function()
          require("treesitter-context").setup {}
        end,
      },
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        event = "VeryLazy",
        commit = "92e688f013c69f90c9bbd596019ec10235bc51de",
      },
      {
        "windwp/nvim-ts-autotag",
        event = "VeryLazy",
        commit = "6be1192965df35f94b8ea6d323354f7dc7a557e4",
        opts = {},
      },
      {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        commit = "f6c71641f6f183427a651c0ce4ba3fb89404fa9e",
      },
    },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "lua",
          "javascript",
          "typescript",
          "tsx",
          "html",
          "css",
          "json",
          "markdown",
          "markdown_inline",
          "go",
        },
        autotag = {
          enable = true,
          enable_close_on_slash = false,
        },
        autopairs = {
          enable = true,
        },
        modules = {},
        sync_install = false,
        ignore_install = {},
        auto_install = true,
        highlight = { enable = true, additional_vim_regex = false, disable = { "markdown" } },
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
        -- rainbow = {
        --   enable = true,
        --   extended_mode = false, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
        --   max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
        -- },
      }
    end,
  },
}
