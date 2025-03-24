vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.have_nerd_font = true
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.numberwidth = 2 -- set number column width to 2 {default 4}
vim.opt.showcmd = true
vim.opt.clipboard = ""
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.wrap = true
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
-- vim.opt.concealcursor = ''
vim.opt.confirm = true -- Confirm to save changes before exiting modified buffer
vim.opt.updatetime = 200
vim.opt.swapfile = false
vim.opt.timeoutlen = 300 -- this affects the <leader> pressing with other keys
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = false -- Enable listchars
vim.opt.listchars = {
	tab = "··", -- Show tabs as two middle dots
	-- trail = "·",      -- Show trailing spaces as a middle dot
	-- extends = "⟩",    -- Show this when text extends beyond screen
	-- precedes = "⟨",   -- Show this when text precedes beyond screen
	nbsp = "␣", -- Show non-breaking spaces
	lead = "·", -- Show leading spaces
	multispace = "·", -- Show multiple spaces as middle dots
	-- eol = "↲", -- Show end of line character
}

vim.opt.fillchars = { eob = " " }

vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 10

-- vim.opt.guicursor =
-- 	"n:block-NCursor,ci:block-NoiceCursor,v:block-VCursor,i-ci-ve:block-ICursor,r-cr-o:block-RCursor,sm:block-ComCursor"
-- vim.opt.guicursor =
-- 	"n:block-deusYellow,ci:block-deusPurple,v:block-deusPurple,i-ci-ve:block-deusGreen,r-cr-o:block-deusRed,sm:block-DeusOrange"
vim.opt.cmdheight = 2

vim.opt.autowrite = true
vim.opt.jumpoptions = "view"
vim.opt.inccommand = "nosplit"
vim.opt.formatoptions = "jcroqlnt"
vim.opt.laststatus = 3
vim.opt.linebreak = true
vim.opt.pumblend = 15
vim.opt.winblend = 8
vim.opt.pumheight = 10
vim.opt.ruler = false
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
vim.shiftround = true
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitkeep = "screen"
vim.opt.splitright = true
vim.opt.undolevels = 10000
vim.opt.virtualedit = "block"
vim.opt.wildmode = "longest:full,full"
vim.opt.winminwidth = 5

vim.opt.smoothscroll = true
vim.opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
vim.opt.foldmethod = "expr"
vim.opt.foldtext = ""

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
