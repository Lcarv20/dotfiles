local fns = require("utils.fns")

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
    "oil",
    "DressingSelect",
    "tsplayground",
    "codecompanion",
    "",
  },
  callback = function()
    vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      nnoremap <silent> <buffer> <esc> :close<CR>
      set nobuflisted
    ]])
  end,
})

-- Cursor style
vim.api.nvim_create_autocmd({ "ColorScheme", "WinEnter" }, {
  pattern = "*",
  callback = fns.cursor_style,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown", "NeogitCommitMessage" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- autocmd to set wrap and spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit", "markdown", "NeogitCommitMessage" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Change highlight of neogitstatus
-- This is only for everfores or themes that don't work well with Neogit
vim.api.nvim_create_autocmd("FileType", {
  pattern = "NeogitStatus",
  callback = function()
    vim.api.nvim_set_hl(0, "NeogitFold", { link = "@text.gitcommit" })
  end,
})

-- disable auto comment for XML & HTML
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "svelte" },
  callback = function()
    vim.opt_local.formatoptions:remove({ "o", "r" }) -- Disable for HTML/XML
  end,
})

-- Illuminate stuff
-- change the highlight style
-- vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "CursorLine" })
-- vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "CursorLine" })
-- vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "CursorLine" })

--- auto update the highlight style on colorscheme change
-- vim.api.nvim_create_autocmd({ "ColorScheme" }, {
--   pattern = { "*" },
--   callback = function(ev)
--     vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "CursorLine" })
--     vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "CursorLine" })
--     vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "CursorLine" })
--   end
-- })

