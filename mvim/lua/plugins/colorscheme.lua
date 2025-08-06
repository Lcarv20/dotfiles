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
			-- vim.api.nvim_set_hl(0, "BlinkCmpDoc", { link = "Pmenu", force = true })
			vim.cmd.colorscheme("gruber-darker")
		end,
	},
	{
		"topazape/oldtale.nvim",
		lazy = false,
		enabled = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("oldtale")
		end,
	},
	{
		"killitar/obscure.nvim",
		enabled = true,
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			-- vim.cmd.colorscheme("obscure")
		end,
	},
	{
		"khoido2003/classic_monokai.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"jesseleite/nvim-noirbuddy",
		dependencies = {
			{ "tjdevries/colorbuddy.nvim" },
		},
		lazy = false,
		priority = 1000,
		opts = {
			-- preset = "miami-nights",
			styles = {
				italic = true,
				bold = true,
			},

			colors = {
				-- backgrounds
				background = "#181818", -- oklch(14.1% 0.005 285.823) - darker, stone-like

				diff_add = "#303f32", -- muted green for additions, adjusted for darker bg
				diff_delete = "#4a3231", -- muted red for deletions, adjusted for darker bg
				diff_change = "#34424b", -- muted blue for changes, adjusted for darker bg

				-- foreground / text
				foreground = "#eae6e1", -- slightly brighter off-white for better contrast
				comment = "#929094", -- muted grey for comments

				-- main accent colors (warm tones, slightly richer against darker background)
				primary = "#e89b6c", -- warm terracotta
				secondary = "#d66b6c", -- muted coral/rose

				-- grayscale palette (adjusted to lean warmer and darker overall)
				noir_0 = "#eae6e1", -- lightest, near foreground
				noir_1 = "#dbd6d2",
				noir_2 = "#c9c5c1",
				noir_3 = "#b7b3af",
				noir_4 = "#a5a19d",
				noir_5 = "#938f8b",
				noir_6 = "#817d79",
				noir_7 = "#6f6b67", -- near comment color
				noir_8 = "#5c5854",
				noir_9 = "#323136", -- darkest, near bg_float

				-- semantic/diagnostic colors (retained warm tones)
				diagnostic_error = "#d66b6c", -- red for errors
				diagnostic_warning = "#e89b6c", -- orange for warnings
				diagnostic_info = "#7a9fc6", -- muted blue for info
				diagnostic_hint = "#a9b87f", -- muted olive for hints
			},
		},
	},

	--- Utilities ---
	{ "typicode/bg.nvim", lazy = false },
	{
		"f-person/auto-dark-mode.nvim",
		enabled = true,
		opts = {
			set_dark_mode = function()
				vim.api.nvim_set_option_value("background", "dark", {})
				-- vim.cmd.colorscheme("noirbuddy")
				require("noirbuddy").setup({
					-- preset = "miami-nights",
					styles = {
						italic = true,
						bold = true,
					},
					colors = {
						background = "#181818", -- oklch(14.1% 0.005 285.823) - darker, stone-like

						diff_add = "#303f32", -- muted green for additions, adjusted for darker bg
						diff_delete = "#4a3231", -- muted red for deletions, adjusted for darker bg
						diff_change = "#34424b", -- muted blue for changes, adjusted for darker bg

						foreground = "#eae6e1", -- slightly brighter off-white for better contrast
						comment = "#929094", -- muted grey for comments

						primary = "#e89b6c", -- warm terracotta
						secondary = "#d66b6c", -- muted coral/rose

						noir_0 = "#eae6e1", -- lightest, near foreground
						noir_1 = "#dbd6d2",
						noir_2 = "#c9c5c1",
						noir_3 = "#b7b3af",
						noir_4 = "#a5a19d",
						noir_5 = "#938f8b",
						noir_6 = "#817d79",
						noir_7 = "#6f6b67", -- near comment color
						noir_8 = "#5c5854",
						noir_9 = "#323136", -- darkest, near bg_float

						diagnostic_error = "#d66b6c", -- red for errors
						diagnostic_warning = "#e89b6c", -- orange for warnings
						diagnostic_info = "#7a9fc6", -- muted blue for info
						diagnostic_hint = "#a9b87f", -- muted olive for hints
					},
				})
			end,
			set_light_mode = function()
				vim.api.nvim_set_option_value("background", "light", {})
				vim.cmd.colorscheme("classic-monokai")
			end,
			update_interval = 3000,
			fallback = "dark",
		},
	},
}
