return {
  "MeanderingProgrammer/render-markdown.nvim",
  -- enabled = false,
  dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
  config = function()
    require("render-markdown").setup {
      code = {
        disable_background = { "diff" },
      },
    }
  end,
}
