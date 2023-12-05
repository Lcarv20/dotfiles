vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = " "
vim.g.skip_ts_context_commentstring_module = true

-- -- Numbers
-- vim.opt.nu = true
-- vim.opt.relativenumber = true
-- vim.opt.ignorecase = true
-- vim.opt.hlsearch = true -- ghlight all matches on previous search pattern
-- vim.opt.mouse = "a"     -- allow the mouse to be used in neovim
-- vim.o.helpheight = 20
-- vim.opt.tabstop = 2
-- vim.opt.softtabstop = 2
-- vim.opt.shiftwidth = 2
-- vim.opt.expandtab = true
-- vim.opt.smartindent = true
-- vim.opt.smartcase = true  -- smart case
-- vim.opt.wrap = false
-- vim.opt.splitbelow = true -- force all horizontal splits to go below current window
-- vim.opt.splitright = true -- force all vertical splits to go to the right of current window
-- vim.opt.swapfile = false
-- vim.opt.backup = false
-- vim.opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
-- vim.opt.undofile = true
-- vim.optncsearch = true
-- -- vim.opt.shortmess:append({ W = true, I = true, c = true, C = true, o = true, s = true })
-- vim.opt.shortmess:append "C"
-- vim.opt.shortmess:append "S" -- We have our own search counter
-- vim.opt.shortmess:append "c"
-- vim.opt.shortmess:append "s"
-- vim.opt.termguicolors = true
-- vim.opt.scrolloff = 8
-- vim.opt.signcolumn = "yes"
-- vim.opt.colorcolumn = "110"
-- vim.opt.textwidth = 110
-- vim.opt.isfname:append "@-@"
-- vim.opt.updatetime = 50
-- vim.opt.completeopt = "menu,menuone,noselect"
-- -- vim.opt.completeopt      = { "menuone", "noselect" }
-- vim.opt.fileencoding = "utf-8"
--
-- --NETRW DISABLED
-- vim.g.loaded_netrwPlugin = 1
--
-- --NETRW ENABLED
-- -- vim.g.netrw_browse_split = 0
-- -- vim.g.netrw_banner = 0
-- -- vim.g.netrw_winsize = 25
-- -- vim.g.netrw_liststyle = 3
-- -- vim.g.netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
--
-- vim.opt.confirm = true
--
-- vim.opt.pumblend = 10  -- Popup blend
-- vim.opt.pumheight = 10 -- Maximum number of entries in a popup
--
-- vim.opt.fillchars = {
--     foldopen = "",
--     foldclose = "",
--     -- fold = "⸱",
--     fold = " ",
--     foldsep = " ",
--     diff = "╱",
--     eob = " ",
-- }
--
-- vim.opt.spell = false
-- vim.opt.cmdheight = 1
--
-- vim.cmd "set whichwrap+=<,>,[,],h,l"
-- vim.cmd [[set formatoptions-=cro]]
--
-- vim.opt.showmode = false
-- vim.opt.listchars = { trail = "·", eol = "$", extends = ">", precedes = "<", tab = "→ ", nbsp = "␣" }
--

vim.opt.backup = false                          -- creates a backup file
vim.opt.cmdheight = 1                           -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
-- vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.pumblend = 10
vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 1                         -- always show tabs
vim.opt.smartcase = true                        -- smart case
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.updatetime = 100                        -- faster completion (4000ms default)
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.shiftwidth = 2                          -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2                             -- insert 2 spaces for a tab
vim.opt.cursorline = true                       -- highlight the current line
vim.opt.number = true                           -- set numbered lines
vim.opt.laststatus = 3
vim.opt.showcmd = false
vim.opt.ruler = false
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.numberwidth = 4       -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes"    -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = false          -- display lines as one long line
vim.opt.scrolloff = 0
vim.opt.sidescrolloff = 8
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.title = false
-- colorcolumn = "80",
-- colorcolumn = "120",
vim.opt.fillchars = vim.opt.fillchars + "eob: "
vim.opt.fillchars:append {
    stl = " ",
}

vim.opt.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]

vim.g.netrw_banner = 0
vim.g.netrw_mouse = 2
