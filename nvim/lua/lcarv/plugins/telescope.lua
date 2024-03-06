local icons = require "lcarv.icons"

return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    branch = "0.1.x",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "ThePrimeagen/harpoon",
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
      -- local harpoon = require "harpoon"
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
              ["<C-d>"] = require("telescope.actions").delete_buffer,
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

      -- local conf = require("telescope.config").values
      --
      -- local function toggle_telescope(harpoon_files)
      --   local file_paths = {}
      --   for _, item in ipairs(harpoon_files.items) do
      --     table.insert(file_paths, item.value)
      --   end
      --
      --   require("telescope.pickers")
      --     .new({}, {
      --       prompt_title = "Harpoon",
      --       finder = require("telescope.finders").new_table {
      --         results = file_paths,
      --       },
      --       previewer = conf.file_previewer {},
      --       sorter = conf.generic_sorter {},
      --       layout_config = { prompt_position = "top", height = 0.4, width = 0.5, preview_cutoff = 0 },
      --       -- layout_strategy = "vertical",
      --     })
      --     :find()
      -- end
      --
      -- vim.keymap.set("n", "<C-e>", function()
      --   toggle_telescope(harpoon:list())
      -- end, { desc = "Open harpoon window" })
    end,
  },
}
