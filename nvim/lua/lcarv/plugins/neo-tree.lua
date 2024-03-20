return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  priority = 1000,
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

    require("neo-tree").setup {
      popup_border_style = "single",
      source_selector = {
        winbar = false,
        statusline = false,
      },
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function(_)
            -- vim.cmd [[setlocal relativenumber]]
            vim.opt_local.relativenumber = true
          end,
          id = "neo_tree_set_relative_number",
        },
        {
          event = "neo_tree_buffer_leave",
          handler = function(_)
            -- close neotree
            vim.cmd [[Neotree close]]
          end,
          id = "neo_tree_set_relative_number",
        },
      },
    }

    vim.cmd [[nnoremap \ :Neotree reveal<cr>]]
  end,
}
