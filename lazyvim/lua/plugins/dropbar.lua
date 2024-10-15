return {
  "Bekaboo/dropbar.nvim",
  -- optional, but required for fuzzy finder support
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")

    require("dropbar").setup()
    vim.ui.select = require("dropbar.utils.menu").select

    wk.add({
      "<leader>D",
      "<cmd>lua require('dropbar.api').pick()<cr>",
      desc = "Dropbar",
      icon = {
        icon = "",
        hl = "MiniIconsGreen",
      },
    })
  end,
}
