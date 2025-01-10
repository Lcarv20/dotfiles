local M = {}

M.cursor_style = function()
  -- create highlights for the different modes
  local colors = require("utils.colors")

  vim.api.nvim_set_hl(0, "NCursor", { bg = colors.blue })
  vim.api.nvim_set_hl(0, "ICursor", { bg = colors.green })
  vim.api.nvim_set_hl(0, "VCursor", { bg = colors.purple })
  vim.api.nvim_set_hl(0, "RCursor", { bg = colors.red })
  vim.api.nvim_set_hl(0, "ComCursor", { bg = colors.yellow })
  vim.api.nvim_set_hl(0, "NoiceCursor", { bg = colors.saphire })

  -- With lazyvim this will be overriden, so we do this in opts.
  -- However the highlights are set on vimenter using an autocmd.
  --
  -- vim.opt.guicursor =
  --   "n:block-NCursor,ci:block-NoiceCursor,v:block-VCursor,i-ci-ve:block-ICursor,r-cr-o:block-RCursor,sm:block-ComCursor"
end

return M

