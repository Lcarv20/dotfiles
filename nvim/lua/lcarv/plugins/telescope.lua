local icons = require "lcarv.icons"

return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    branch = "0.1.x",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        lazy = true,
        cond = function()
          return vim.fn.executable "make" == 1
        end,
      },
    },
    config = function()
      local telescope = require "telescope"
      telescope.setup {
        defaults = {
          prompt_prefix = " " .. icons.ui.Search .. " ",
          sorting_strategy = "ascending", -- display results top->bottom
          layout_config = {
            prompt_position = "top", -- search bar at the top
          },
          mappings = {
            i = {
              ["<C-u>"] = false,
              ["<C-d>"] = false,
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          },
        },
      }
      -- Enable telescope fzf native, if installed
      telescope.load_extension "fzf"
    end,
  },
}
