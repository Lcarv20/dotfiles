return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  dependencies = {
    {
      "echasnovski/mini.nvim",
      version = false,
      config = function()
        require("mini.icons").setup()
      end,
    },
  },
  opts = {
    preset = "helix",
    win = {
      title = " ",
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show { global = false }
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
