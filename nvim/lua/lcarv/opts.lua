vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = " "
-- Numbers
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.ignorecase = true

vim.o.helpheight = 20

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.completeopt = "menu,menuone,noselect"

--NETRW DISABLED
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

--NETRW ENABLED
-- vim.g.netrw_browse_split = 0
-- vim.g.netrw_banner = 0
-- vim.g.netrw_winsize = 25
-- vim.g.netrw_liststyle = 3
-- vim.g.netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

vim.opt.confirm = true

vim.opt.pumblend = 10  -- Popup blend
vim.opt.pumheight = 10 -- Maximum number of entries in a popup

vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  -- fold = "⸱",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

vim.opt.spell = false

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set formatoptions-=cro]]
