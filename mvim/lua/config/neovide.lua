local map = vim.keymap.set
-- local ignore = { desc = "which_key_ignore" }
local opts = { silent = true, noremap = true }

-- font
vim.o.guifont = "caskaydiaCove NF:h14:#e-subpixelantialias:#h-none"
vim.opt.linespace = 12

-- auto theme
vim.g.neovide_theme = "auto"

vim.g.neovide_window_blurred = true
vim.g.neovide_show_border = true

vim.g.neovide_title_background_color =
	string.format("%x", vim.api.nvim_get_hl(0, { id = vim.api.nvim_get_hl_id_by_name("Normal") }).bg)

vim.g.neovide_title_text_color = "pink"

vim.g.neovide_floating_blur_amount_x = 5.0
vim.g.neovide_floating_blur_amount_y = 5.0

vim.g.neovide_floating_corner_radius = 0.3

vim.g.neovide_opacity = 0.8
vim.g.neovide_normal_opacity = 0.8


-- copy/paste
map("v", "<D-c>", '"+y', opts)
map("n", "<D-v>", '"+P', opts)
map("v", "<D-v>", '"+P', opts)
map("c", "<D-v>", "<C-R>+", opts)
map("i", "<D-v>", "<C-R>+", opts)

-- delete aka macos
map({ "i", "c" }, "<D-BS>", "<C-u>", opts) -- Meta + Backspace
map({ "i", "c" }, "<A-BS>", "<C-w>", opts) -- Option + Backspace

-- Move line down/up with Option+j(∆)/Option+k(˚)
map("n", "∆", ":m .+1<CR>==", opts)
map("n", "˚", ":m .-2<CR>==", opts)

map("x", "∆", ":m '>+1<CR>gv-gv", opts)
map("x", "˚", ":m '<-2<CR>gv-gv", opts)
map("i", "∆", "<Esc>:m .+1<CR>==gi", opts)
map("i", "˚", "<Esc>:m .-2<CR>==gi", opts)

-- borders && others
require("telescope").setup({
	defaults = {
		border = false,
	},
	pickers = {
		colorscheme = {
			enable_preview = true,
			-- borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
			border = false,
		},
		find_files = {
			theme = "dropdown",
			-- coppied from lazyvim
			find_command = function()
				if 1 == vim.fn.executable("rg") then
					return { "rg", "--files", "--color", "never", "-g", "!.git" }
				elseif 1 == vim.fn.executable("fd") then
					return { "fd", "--type", "f", "--color", "never", "-E", ".git" }
				elseif 1 == vim.fn.executable("fdfind") then
					return { "fdfind", "--type", "f", "--color", "never", "-E", ".git" }
				elseif 1 == vim.fn.executable("find") and vim.fn.has("win32") == 0 then
					return { "find", ".", "-type", "f" }
				elseif 1 == vim.fn.executable("where") then
					return { "where", "/r", ".", "*" }
				end
			end,
			hidden = true,
			-- borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
			border = false,
		},
		live_grep = {
			theme = "ivy",
			borderchars = { " ", "│", " ", " ", " ", " ", " ", " " },
		},
		diagnostics = {
			theme = "ivy",
			border = false,
			-- borderchars = { " ", "│", " ", " ", " ", " ", " ", " " },
		},
		git_files = {
			theme = "dropdown",
			-- borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
			border = false,
		},
		oldfiles = {
			theme = "dropdown",
			previewer = false,
			-- borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
			border = false,
		},
		buffers = {
			theme = "dropdown",
			previewer = false,
			border = false,
		},
		lsp_definitions = {
			theme = "ivy",
			borderchars = { " ", "│", " ", " ", " ", " ", " ", " " },
		},
		lsp_references = {
			theme = "ivy",
			borderchars = { " ", "│", " ", " ", " ", " ", " ", " " },
		},
		lsp_implementations = {
			theme = "ivy",
			borderchars = { " ", "│", " ", " ", " ", " ", " ", " " },
		},
		lsp_type_definitons = {
			theme = "ivy",
			borderchars = { " ", "│", " ", " ", " ", " ", " ", " " },
		},
		help_tags = {
			border = false,
		},
	},
})

require("mini.notify").setup({
	window = {
		config = {
			border = "none",
		},
	},
})

local fns = require("utils.fns")

fns.diagnostics_config("none")
fns.lsp_popover_borders("none")
