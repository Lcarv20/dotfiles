local colors = require "lcarv.colors"
local fns = require "lcarv.fns"

local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- -- Help at the bottom
vim.cmd [[autocmd BufWinEnter,FileType help wincmd J]]

-- close with q for certain FileType
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "netrw",
    "Jaq",
    "qf",
    "git",
    "help",
    "man",
    "lspinfo",
    "spectre_panel",
    "lir",
    "DressingSelect",
    "tsplayground",
    "",
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

-- Cursor style
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = fns.cursorStyle,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown", "NeogitCommitMessage" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "EyelinerPrimary", { fg = colors.pink_shock, underline = true })
    vim.api.nvim_set_hl(0, "EyelinerSecondary", { fg = colors.cyan, bold = true, underline = true })
  end,
})
