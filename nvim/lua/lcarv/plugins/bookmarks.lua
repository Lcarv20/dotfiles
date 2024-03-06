return {
  "tomasky/bookmarks.nvim",
  event = "VeryLazy",
  -- lazy = true,
  config = function()
    require("telescope").load_extension "bookmarks"

    require("bookmarks").setup {
      sign_priority = 20,
      save_file = vim.fn.expand(vim.loop.cwd() .. "/.bookmarks"), -- bookmarks save file path
      keywords = {
        ["todo:"] = "", -- mark annotation startswith @t ,signs this icon as `Todo`
        ["warning:"] = "", -- mark annotation startswith @w ,signs this icon as `Warn`
        ["fixme;"] = "⛏", -- mark annotation startswith @f ,signs this icon as `Fix`
        ["note:"] = "󰎞", -- mark annotation startswith @n ,signs this icon as `Note`
      },
      on_attach = function()
        local bm = require "bookmarks"
        local map = vim.keymap.set

        map("n", "mb", bm.bookmark_toggle, { desc = "toggle bookmark" }) -- add or remove bookmark at current line
        map("n", "mi", bm.bookmark_ann, { desc = "insert bookmark" }) -- add or edit mark annotation at current line
        map("n", "mc", bm.bookmark_clean, { desc = "Clean bookmarks" }) -- clean all marks in local buffer
        map("n", "mn", bm.bookmark_next, { desc = "next bookmark" }) -- jump to next mark in local buffer
        map("n", "mp", bm.bookmark_prev, { desc = "previous bookmark" }) -- jump to previous mark in local buffer
        map("n", "ml", bm.bookmark_list, { desc = "list bookmarks" }) -- show marked file list in quickfix window
        map("n", "mt", function()
          require("telescope").extensions.bookmarks.list()
        end, { desc = "telescope bookmarks" })
      end,
    }
  end,
}
