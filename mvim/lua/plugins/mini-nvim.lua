return {
	"echasnovski/mini.nvim",
	config = function()
		-- Better Around/Inside textobjects
		--
		-- Examples:
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
		--  - ci'  - [C]hange [I]nside [']quote
		require("mini.ai").setup({ n_lines = 500 })

		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		--
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']
		require("mini.surround").setup()

		require("mini.pairs").setup()

		require("mini.indentscope").setup({
			symbol = "┋",
		})

		-- require("mini.base16").setup({
		-- 	palette = {
		-- 		base00 = "#1c1d23", -- Background: Dark, subtle grey
		-- 		base01 = "#1c1d23", -- Lighter background for line number column
		-- 		base02 = "#4f5258", -- Even lighter background for selections, etc.
		-- 		base03 = "#8691a7", -- Comments, non-intrusive
		-- 		base04 = "#bfc4d1", -- Subtle secondary text
		-- 		base05 = "#d5dc81", -- Primary text, slightly vibrant
		-- 		base06 = "#e2e98f", -- Highlights or brighter text
		-- 		base07 = "#f7f7ff", -- White for extreme highlights
		-- 		base08 = "#cc7e46", -- Red/orange for errors or warnings
		-- 		base09 = "#ffbf00", -- Yellow for warnings or hints
		-- 		base0A = "#7cafc4", -- Cyan for accents or links
		-- 		base0B = "#89b482", -- Green for success messages
		-- 		base0C = "#6a99d4", -- Blue for general accents
		-- 		base0D = "#a29bfe", -- Violet for headings or important elements
		-- 		base0E = "#db8fd9", -- Magenta for special accents
		-- 		base0F = "#ffffff", -- Red for critical errors
		-- 	},
		-- 	use_cterm = true,
		-- 	plugins = {
		-- 		default = true,
		-- 		["echasnovski/mini.nvim"] = true,
		-- 	},
		-- })

    -- Transparent background
    -- vim.cmd([[
    --   highlight Normal guibg=NONE ctermbg=NONE
    --   highlight NonText guibg=NONE ctermbg=NONE
    --   " Add other highlight groups as needed, e.g.,
    --   " highlight LineNr guibg=NONE ctermbg=NONE
    --   " highlight CursorLine guibg=NONE ctermbg=NONE
    -- ]])

		-- Apply transparency to the command line and line number column
		vim.cmd([[
  highlight! link CmdLine Normal
  highlight! LineNr guibg=NONE guifg=#606b81
  highlight! CursorLineNr guibg=NONE guifg=#d5dc81
]])

		-- require("mini.base16").setup({
		-- 	palette = {
		-- 		base00 = "#112641",
		-- 		base01 = "#3a475e",
		-- 		base02 = "#606b81",
		-- 		base03 = "#8691a7",
		-- 		base04 = "#d5dc81",
		-- 		base05 = "#e2e98f",
		-- 		base06 = "#eff69c",
		-- 		base07 = "#fcffaa",
		-- 		base08 = "#ffcfa0",
		-- 		base09 = "#cc7e46",
		-- 		base0A = "#46a436",
		-- 		base0B = "#9ff895",
		-- 		base0C = "#ca6ecf",
		-- 		base0D = "#42f7ff",
		-- 		base0E = "#ffc4ff",
		-- 		base0F = "#00a5c5",
		-- 	},
		-- 	use_cterm = true,
		-- 	plugins = {
		-- 		default = true,
		-- 		["echasnovski/mini.nvim"] = true,
		-- 	},
		-- })
		--
		-- vim.cmd([[
		--   highlight Normal guibg=none ctermbg=none
		--   highlight NonText guibg=none ctermbg=none
		--   " Add other highlight groups as needed, e.g.,
		--   " highlight LineNr guibg=none ctermbg=none
		--   " highlight CursorLine guibg=none ctermbg=none
		-- ]])

		-- Simple and easy statusline.
		local statusline = require("mini.statusline")
		-- set use_icons to true if you have a Nerd Font
		statusline.setup({ use_icons = vim.g.have_nerd_font })

		-- You can configure sections in the statusline by overriding their
		-- default behavior. For example, here we set the section for
		-- cursor location to LINE:COLUMN
		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_location = function()
			return "%2l:%-2v"
		end
	end,
}
