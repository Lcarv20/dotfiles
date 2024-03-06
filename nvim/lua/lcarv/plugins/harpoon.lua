return {
  {
    -- event = "VeryLazy",
    "Lcarv20/harpoon_leg",
    enabled = false,
    name = "harpoon-legacy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local function map(mode, mapping, cmd, opts)
        opts = opts or {}
        opts.silent = true
        vim.keymap.set(mode, mapping, cmd, opts)
      end

      -- Harpoon
      local mark = require "harpoon.mark"
      local ui = require "harpoon.ui"

      map("n", "ma", mark.add_file, { desc = "[a]dd file" })
      map("n", "mm", ui.toggle_quick_menu, { desc = "[m]enu" })

      map("n", "<C-1>", function()
        ui.nav_file(1)
      end)
      map("n", "<C-2>", function()
        ui.nav_file(2)
      end)
      map("n", "<C-3>", function()
        ui.nav_file(3)
      end)
      map("n", "<C-4>", function()
        ui.nav_file(4)
      end)
    end,
  },
  {
    "ThePrimeagen/harpoon",
    enabled = false,
    branch = "harpoon2",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require "harpoon"

      -- REQUIRED
      harpoon:setup()

      local opts = { border = "rounded" }
      -- REQUIRED

      harpoon:extend {
        UI_CREATE = function(cx)
          vim.keymap.set("n", "<C-v>", function()
            harpoon.ui:select_menu_item { vsplit = true }
          end, { buffer = cx.bufnr })

          vim.keymap.set("n", "<C-x>", function()
            harpoon.ui:select_menu_item { split = true }
          end, { buffer = cx.bufnr })

          vim.keymap.set("n", "<C-t>", function()
            harpoon.ui:select_menu_item { tabedit = true }
          end, { buffer = cx.bufnr })
        end,
      }

      vim.keymap.set("n", "ma", function()
        harpoon:list():append()
      end)
      vim.keymap.set("n", "mm", function()
        harpoon.ui:toggle_quick_menu(harpoon:list(), opts)
      end, { desc = "Toggle Harpoon menu" })

      vim.keymap.set("n", "<C-1>", function()
        harpoon:list():select(1)
      end)
      vim.keymap.set("n", "<C-2>", function()
        harpoon:list():select(2)
      end)
      vim.keymap.set("n", "<C-3>", function()
        harpoon:list():select(3)
      end)
      vim.keymap.set("n", "<C-4>", function()
        harpoon:list():select(4)
      end)

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set("n", "mp", function()
        harpoon:list():prev()
      end)
      vim.keymap.set("n", "mn", function()
        harpoon:list():next()
      end)
    end,
  },
}
