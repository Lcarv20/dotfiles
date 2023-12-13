local fns = require "lcarv.fns"

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- Help at the bottom
vim.cmd [[autocmd BufWinEnter,FileType help wincmd J]]

-- close with q for certain FileType
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "help",
    "man",
    "lspinfo",
    "qf",
    "spectre_panel",
  },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      nnoremap <silent> <buffer> <esc> :close<CR>
      set nobuflisted
    ]]
  end,
})

-- Neotree
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    if vim.bo.ft == "neo-tree" then
      vim.cmd "setlocal number"
      vim.cmd "setlocal relativenumber"
    end
  end,
})
vim.api.nvim_create_autocmd("BufLeave", {
  pattern = "*",
  callback = function()
    if vim.bo.ft == "neo-tree" then
      vim.cmd "NeoTreeClose"
    end
  end,
})
-- Nvimtree
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    if vim.bo.ft == "NvimTree" then
      vim.cmd "setlocal number"
      vim.cmd "setlocal relativenumber"
    end
  end,
})
vim.api.nvim_create_autocmd("BufLeave", {
  pattern = "*",
  callback = function()
    if vim.bo.ft == "NvimTree" then
      vim.cmd "NeoTreeClose"
    end
  end,
})

-- Cursor style
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = fns.cursorStyle,
})


