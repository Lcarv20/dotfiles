return {
	{
		"Lcarv20/gruber-darker.nvim",
		enabled = false,
		config = function()
			require("gruber-darker").setup({
				-- OPTIONAL
				-- transparent = true, -- removes the background
				underline = true, -- disables underline fonts
				bold = true, -- disables bold fonts
			})

			-- local colors = require("utils.colors")

			vim.api.nvim_set_hl(0, "BlinkCmpDoc", { link = "Pmenu", force = true })
		end,
	},
	{
		"topazape/oldtale.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme("oldtale")
		end,
	},
	{
		"drewxs/ash.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			require("ash").setup({})
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		enabled = false,
		opts = {
			styles = {
				bold = true,
				italic = true,
				-- transparency = true,
			},
		},
		config = function(_, opts)
			require("rose-pine").setup(opts)
			vim.api.nvim_set_hl(0, "RenderMarkdownCode", { link = "NormalFloat" })
		end,
	},
	{
		"sainnhe/gruvbox-material",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.gruvbox_material_background = "hard" -- "medium",  "soft"
			vim.g.gruvbox_material_enable_italic = true
			vim.g.gruvbox_material_enable_bold = true
			vim.g.gruvbox_material_transparent_background = 0 -- 1, 2
			vim.g.gruvbox_material_disable_italic_comment = false
			vim.g.gruvbox_material_dim_inactive_windows = false
			vim.g.gruvbox_material_visual = "red background" -- 'grey background', 'green background', 'blue background', 'red background', 'reverse'
			vim.g.gruvbox_material_menu_selection_background = "orange" -- 'grey', 'red', 'orange', 'yellow', 'green', 'aqua', 'blue', 'purple'
			vim.g.gruvbox_material_sign_column_background = "none" -- 'grey'
			vim.g.gruvbox_material_spell_foreground = "none" -- "colored"
			vim.g.gruvbox_material_ui_contrast = "hight" -- "High"
			vim.g.gruvbox_material_show_eob = true
			vim.g.gruvbox_material_float_style = "dim" -- "dim"
			vim.g.gruvbox_material_diagnostic_text_highlight = false
			vim.g.gruvbox_material_diagnostic_line_highlight = false
			vim.g.gruvbox_material_diagnostic_virtual_text = "highlighted" -- "colored", "highlighted"
			vim.g.gruvbox_material_current_word = "grey background" -- 'grey background', 'high contrast background', 'bold', 'underline', 'italic'
			vim.g.gruvbox_material_inlay_hints_background = "none" -- "dimmed""
			vim.g.gruvbox_material_disable_terminal_colors = false
			vim.g.gruvbox_material_statusline_style = "default" -- "mix", "original"
			vim.g.gruvbox_material_lightline_disable_bold = false
			vim.g.gruvbox_material_better_performance = false
			vim.g.gruvbox_material_cursor = "aqua" --  'red', 'orange', 'yellow', 'green', 'aqua', 'blue', 'purple'

			-- vim.g.gruvbox_material_colors_override = {
			-- 	bg0 = { "#181818", "234" },
			-- 	-- bg2 = { "#282828", "235" },
			-- }

			vim.api.nvim_set_hl(0, "blinkcmpdocseparator", { link = "normal", force = true })
			vim.api.nvim_set_hl(0, "blinkcmpdocborder", { link = "pmenu", force = true })
		end,
	},
	{
		"folke/tokyonight.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		opts = {
			style = "night",
			on_colors = function(colors)
				-- colors.bg = "#ffffff"
			end,
		},
	},
	{
		"wtfox/jellybeans.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = false,
			italics = true,
			bold = true,
			flat_ui = false, -- toggles "flat UI" for pickers
			background = {
				dark = "jellybeans", -- default dark palette
				light = "jellybeans_light", -- default light palette
			},
			plugins = {
				all = true,
				auto = true, -- will read lazy.nvim and apply the colors for plugins that are installed
			},
			on_highlights = function(highlights, colors)
				highlights.NormalFloat = { bg = colors.bg, fg = colors.fg }

				-- vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = "#151515" }) -- Or "ColorColumn", "Comment", etc.
				highlights.RenderMarkdownCode = { bg = "#151515" }
			end,
			on_colors = function(colors) end,
		},
	},

	--- Utilities ---
	{ "typicode/bg.nvim", lazy = false },
	{
		"f-person/auto-dark-mode.nvim",
		enabled = false,
		opts = {
			set_dark_mode = function()
				vim.api.nvim_set_option_value("background", "dark", {})
				vim.cmd.colorscheme("tokyonight")
			end,
			set_light_mode = function()
				vim.api.nvim_set_option_value("background", "light", {})
				vim.cmd.colorscheme("tokyonight")
			end,
			update_interval = 3000,
			fallback = "dark",
		},
	},
}
