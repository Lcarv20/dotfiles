return {
  "tpope/vim-sleuth",
  -- {
  --   event = "VeryLazy",
  --   "ThePrimeagen/harpoon",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  -- },
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  { "mbbill/undotree", event = "VeryLazy" },
  {
    "petertriho/nvim-scrollbar",
    event = "VeryLazy",
    opts = {},
  },

  -- Changes bg of kitty to match nvim
  { "typicode/bg.nvim", lazy = false, priority = 1000 },
  {
    "b0o/schemastore.nvim",
    event = "VeryLazy",
    lazy = true,
  },
}
