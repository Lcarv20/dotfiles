vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.winborder = "rounded"
vim.g.have_nerd_font = true
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.numberwidth = 2 -- set number column width to 2 {default 4}
vim.opt.showtabline = 1
vim.opt.showcmd = true
vim.opt.cmdheight = 2
vim.opt.clipboard = ""
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.wrap = false
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.smoothscroll = true
vim.opt.conceallevel = 0 -- hide * markup for bold and italic, but not markers with substitutions
vim.opt.concealcursor = "nvic"
vim.opt.guicursor =
	"n:block-NCursor,ci:block-NoiceCursor,v:block-VCursor,i-ci-ve:block-ICursor,r-cr-o:block-RCursor,sm:block-ComCursor"
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

vim.opt.fillchars = { eob = " ", fold = " ", foldopen = "", foldsep = " ", foldclose = "", diff = " " }
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.autowrite = true
vim.opt.jumpoptions = "view"
vim.opt.inccommand = "nosplit"
vim.opt.formatoptions = "jcroqlnt"
vim.opt.laststatus = 3
vim.opt.linebreak = true
vim.opt.pumheight = 10
vim.opt.ruler = false
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
vim.shiftround = true
vim.opt.splitkeep = "screen"
vim.opt.undolevels = 10000
vim.opt.virtualedit = "block"
vim.opt.wildmode = "longest:full,full"
vim.opt.winminwidth = 5

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })

-- Find the project root by searching for a marker file like .git
local function find_project_root()
	local dir = vim.fn.getcwd()
	local path_to_search = vim.fs.normalize(dir)
	local marker_files = vim.fs.find(
		{ ".git", "package.json", "go.mod" },
		{ path = path_to_search, upward = true, stop = vim.env.HOME }
	)
	if marker_files and #marker_files > 0 then
		local root_dir = vim.fs.dirname(marker_files[1])
		local project_name = vim.fs.basename(root_dir)
		return project_name
	end
	return nil
end

-- Update the terminal title when the buffer changes
vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
	callback = function()
		local project_name = find_project_root() or "Neovim"
		vim.opt.titlestring = string.format(" %s |  %%t", project_name)
	end,
})

-- Set the title on startup
local project_name = find_project_root() or "Neovim"
vim.opt.title = true
vim.opt.titlestring = string.format(" - %s | %%t", project_name)
