vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("lcarv.plugins", {
  install = {
    colorscheme = {"github_dark_default", "tokyonight-night", "rose-pine", "habamax" },
  },
  ui = {
    border = "double",
    -- border = { "▄", "▄", "▄", "█", "▀", "▀", "▀", "█" },
    -- border = "shadow",
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
})
