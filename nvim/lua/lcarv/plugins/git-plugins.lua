local icons = require "lcarv.icons"

return {
  -- Git related plugins
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = {
          hl = "GitSignsAdd",
          text = icons.ui.BoldLineLeft,
          numhl = "GitSignsAddNr",
          linehl = "GitSignsAddLn",
        },
        change = {
          hl = "GitSignsChange",
          text = icons.ui.BoldLineLeft,
          numhl = "GitSignsChangeNr",
          linehl = "GitSignsChangeLn",
        },
        delete = {
          hl = "GitSignsDelete",
          text = icons.ui.TriangleShortArrowRight,
          numhl = "GitSignsDeleteNr",
          linehl = "GitSignsDeleteLn",
        },
        topdelete = {
          hl = "GitSignsDelete",
          text = icons.ui.TriangleShortArrowRight,
          numhl = "GitSignsDeleteNr",
          linehl = "GitSignsDeleteLn",
        },
        changedelete = {
          hl = "GitSignsChange",
          text = icons.ui.BoldLineLeft,
          numhl = "GitSignsChangeNr",
          linehl = "GitSignsChangeLn",
        },
      },
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
      update_debounce = 200,
      max_file_length = 40000,
      preview_config = {
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
      on_attach = function(bufnr)
        vim.keymap.set(
          "n",
          "<leader>gp",
          require("gitsigns").prev_hunk,
          { buffer = bufnr, desc = "go to [P]revious Hunk" }
        )

        vim.keymap.set("n", "<leader>gn", require("gitsigns").next_hunk, { buffer = bufnr, desc = "go to [N]ext Hunk" })
        vim.keymap.set("n", "<leader>gi", require("gitsigns").preview_hunk_inline, { buffer = bufnr, desc = "preview [i]nline" })
        vim.keymap.set("n", "<leader>gh", require("gitsigns").preview_hunk, { buffer = bufnr, desc = "preview [h]unk" })
        vim.keymap.set("n", "<leader>gd", require("gitsigns").diffthis, { buffer = bufnr, desc = "[d]iff file" })
      end,
    },
  },
  {
    "NeogitOrg/neogit",
    dependencies = "nvim-lua/plenary.nvim",
    event = "VeryLazy",
    opts = {
      disable_signs = false,
      -- disable_hint = true,
      disable_context_highlighting = false,
      disable_commit_confirmation = true,
      disable_insert_on_commit = "auto",
      -- Neogit refreshes its internal state after specific events, which can be expensive depending on the repository size.
      -- Disabling `auto_refresh` will make it so you have to manually refresh the status after you open it.
      auto_refresh = true,
      disable_builtin_notifications = false,
      use_magit_keybindings = false,
      -- Change the default way of opening neogit
      kind = "tab",
      -- Change the default way of opening the commit popup
      commit_popup = {
        kind = "split",
      },
      -- Change the default way of opening popups
      popup = {
        kind = "split",
      },
      -- customize displayed signs
      signs = {
        -- { CLOSED, OPENED }
        section = { icons.ui.ChevronRight, icons.ui.ChevronShortDown },
        item = { icons.ui.ChevronRight, icons.ui.ChevronShortDown },
        hunk = { "", "" },
      },
      integrations = {
        diffview = true,
      },
      -- Setting any section to `false` will make the section not render at all
    },
  },
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  },
}
