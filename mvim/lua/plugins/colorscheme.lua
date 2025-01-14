return {
	{
		"aliqyan-21/darkvoid.nvim",
		enabled = false,
		config = function()
			require("darkvoid").setup({
				transparent = true,
				glow = true,
				show_end_of_buffer = true,

				colors = {
					fg = "#c0c0c0",
					bg = "#1c1c1c",
					cursor = "#bdfe58",
					line_nr = "#404040",
					visual = "#303030",
					comment = "#585858",
					-- string = "#d1d1d1",
					string = "#9ee9a9",
					func = "#e1e1e1",
					-- func = "#7df8f6",
					kw = "#f1f1f1",
					identifier = "#b1b1b1",
					type = "#7df8f6",
					type_builtin = "#c5c5c5", -- current
					-- type_builtin = "#8cf8f7", -- glowy blue old
					-- (was present by default before type_builtin was
					-- introduced added here for people who may like it)
					search_highlight = "#e31999",
					operator = "#1bfd9c",
					bracket = "#e6e6e6",
					preprocessor = "#4b8902",
					bool = "#66b2b2",
					constant = "#b2d8d8",

					-- enable or disable specific plugin highlights
					plugins = {
						gitsigns = true,
						nvim_cmp = true,
						treesitter = true,
						nvimtree = true,
						telescope = true,
						lualine = true,
						bufferline = true,
						oil = true,
						whichkey = true,
						nvim_notify = true,
					},

					-- gitsigns colors
					added = "#baffc9",
					changed = "#ffffba",
					removed = "#ffb3ba",

					-- Pmenu colors
					pmenu_bg = "#1c1c1c",
					pmenu_sel_bg = "#1bfd9c",
					pmenu_fg = "#c0c0c0",

					-- EndOfBuffer color
					eob = "#3c3c3c",

					-- Telescope specific colors
					border = "#585858",
					title = "#bdfe58",

					-- bufferline specific colors
					bufferline_selection = "#1bfd9c",

					-- LSP diagnostics colors
					error = "#dea6a0",
					warning = "#d6efd8",
					hint = "#bedc74",
					info = "#7fa1c3",
				},
			})
			vim.cmd("colorscheme darkvoid")
		end,
	},
	{
		"Lcarv20/gruber-darker.nvim",
		-- enabled = false,
		config = function()
			require("gruber-darker").setup({
				-- OPTIONAL
				transparent = true, -- removes the background
				underline = true, -- disables underline fonts
				bold = true, -- disables bold fonts
			})
			local colors = require("gruber-darker.groups").colors

			-- List chars
			vim.api.nvim_set_hl(0, "Whitespace", {
				fg = colors.niagara_1,
				-- ctermfg = 240,
			})

			-- Indent scope
			vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", {
				fg = colors.brown,
			})

			-- Eyeliner
			vim.api.nvim_set_hl(0, "EyelinerPrimary", { bold = true, bg = colors.yellow, fg = colors.bg })
			vim.api.nvim_set_hl(0, "EyelinerSecondary", { bg = colors.red, fg = colors.bg })

			-- Blink
			vim.api.nvim_set_hl(0, "BlinkCmpScrollBarThumb", { bg = colors.green })
			-- vim.api.nvim_set_hl(0, "BlinkCmpDoc", { link = "Pmenu" })

			-- Telescope
			vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = colors.bg, bg = colors.red })

			vim.cmd.colorscheme("gruber-darker")
		end,
	},
}
