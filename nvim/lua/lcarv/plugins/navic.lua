-- return {
--   "utilyre/barbecue.nvim",
--   name = "barbecue",
--   version = "*",
--   dependencies = {
--     "SmiteshP/nvim-navic",
--     "nvim-tree/nvim-web-devicons", -- optional dependency
--   },
--   opts = {
--     exclude_filetypes = { "neo-tree" },
--     attach_navic = false,
--   },
-- }

local M = {
  "SmiteshP/nvim-navic",
  commit = "0ffa7ffe6588f3417e680439872f5049e38a24db",
}

function M.config()
  local icons = require "lcarv.icons"
  require("nvim-navic").setup {
    icons = icons.kind,
    highlight = true,
    lsp = {
      auto_attach = true,
    },
    click = true,
    separator = " " .. icons.ui.ChevronRight .. " ",
    depth_limit = 0,
    depth_limit_indicator = "..",
  }
end

return M

