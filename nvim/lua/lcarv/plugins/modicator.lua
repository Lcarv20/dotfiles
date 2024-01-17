return {
  "mawkler/modicator.nvim",
  dependencies = "mawkler/onedark.nvim", -- Add your colorscheme plugin here
  lazy = true,
  event = "VeryLazy",
  -- init = function()
  --   -- These are required for Modicator to work
  --   vim.o.cursorline = true
  --   vim.o.number = true
  --   vim.o.termguicolors = true
  -- end,
  opts = {},
}
