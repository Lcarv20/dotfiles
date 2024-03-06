return {
  "Bekaboo/dropbar.nvim",
  enabled = false,
  -- optional, but required for fuzzy finder support
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("dropbar").setup()
    vim.ui.select = require("dropbar.utils.menu").select
    vim.api.nvim_set_keymap("n", " Ed", '<cmd>lua require("dropbar.api").pick()<cr>', { noremap = true, silent = true, desc = "dropbar [h]ome" })
  end,
}
