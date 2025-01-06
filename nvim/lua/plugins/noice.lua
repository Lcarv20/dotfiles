return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- lsp = {
    --   hover = {
    --     border = { style = "single" }, -- Global border style for hover
    --   },
    --   signature = {
    --     border = { style = "single" }, -- Global border style for signature help
    --   },
    -- },
    presets = {
      lsp_doc_border = true,
    },
    routes = {
      {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = {
          skip = true,
        },
      },
    },
  },
}
