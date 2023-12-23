local M = {}

M.nmap = function(keys, func, desc)
  if desc then
    desc = "LSP: " .. desc
  end

  vim.keymap.set("n", keys, func, { desc = desc, noremap = true })
end

M.cursorStyle = function()
  -- create highlights for the different modes
  local colors = require("lcarv.colors")

  vim.api.nvim_set_hl(0, "NCursor", { bg = colors.mauve })
  vim.api.nvim_set_hl(0, "ICursor", { bg = colors.green })
  vim.api.nvim_set_hl(0, "VCursor", { bg = colors.red })
  vim.api.nvim_set_hl(0, "RCursor", { bg = colors.yellow })
  vim.api.nvim_set_hl(0, "NoiceCursor", { bg = colors.saphire })

  vim.opt.guicursor = "n:block-NCursor,ci:block-NoiceCursor,v:block-VCursor,i-ci-ve:block-ICursor,r-cr-o:block-RCursor"
end

return M
