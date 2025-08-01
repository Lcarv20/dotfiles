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
			-- -- LIGHT BG
			-- colors = {
			-- 	-- Backgrounds
			-- 	background = "#EAE6E1", -- Light background
			-- 	bg_float = "#DBD6D2",
			-- 	bg_popup = "#DBD6D2",
			-- 	bg_visual = "#C9C5C1",
			-- 	bg_search = "#C9C5C1",
			-- 	diff_add = "#E6F0E7", -- Light green for additions
			-- 	diff_delete = "#F7E6E6", -- Light red for deletions
			-- 	diff_change = "#E6EFF5", -- Light blue for changes
			--
			-- 	-- Foreground / Text
			-- 	foreground = "#181818", -- Dark text for contrast
			-- 	comment = "#7A787C", -- Muted grey for comments
			--
			-- 	-- Main accent colors (similar warm tones but adjusted for light background)
			-- 	primary = "#C76B3B", -- Adjusted terracotta for light background
			-- 	secondary = "#B54B4C", -- Adjusted coral/rose for light background
			--
			-- 	-- Grayscale palette (adjusted for light background)
			-- 	noir_0 = "#181818", -- Darkest, near foreground
			-- 	noir_1 = "#2A292C",
			-- 	noir_2 = "#3C3B3E",
			-- 	noir_3 = "#4E4D50",
			-- 	noir_4 = "#605F62",
			-- 	noir_5 = "#727174",
			-- 	noir_6 = "#848386",
			-- 	noir_7 = "#969598", -- Near comment color
			-- 	noir_8 = "#A8A7AA",
			-- 	noir_9 = "#DBD6D2", -- Lightest, near bg_float
			--
			-- 	-- Semantic/diagnostic colors (retained warm tones but adjusted for light background)
			-- 	diagnostic_error = "#B54B4C", -- Adjusted red for errors
			-- 	diagnostic_warning = "#C76B3B", -- Adjusted orange for warnings
			-- 	diagnostic_info = "#4A7FB8", -- Adjusted blue for info
			-- 	diagnostic_hint = "#8B9F6E", -- Adjusted olive for hints
			-- },

			colors = {
				-- Backgrounds
				background = "#181818", -- oklch(14.1% 0.005 285.823) - Darker, stone-like

				diff_add = "#303F32", -- Muted green for additions, adjusted for darker bg
				diff_delete = "#4A3231", -- Muted red for deletions, adjusted for darker bg
				diff_change = "#34424B", -- Muted blue for changes, adjusted for darker bg

				-- Foreground / Text
				foreground = "#EAE6E1", -- Slightly brighter off-white for better contrast
				comment = "#929094", -- Muted grey for comments

				-- Main accent colors (warm tones, slightly richer against darker background)
				primary = "#E89B6C", -- Warm terracotta
				secondary = "#D66B6C", -- Muted coral/rose

				-- Grayscale palette (adjusted to lean warmer and darker overall)
				noir_0 = "#EAE6E1", -- Lightest, near foreground
				noir_1 = "#DBD6D2",
				noir_2 = "#C9C5C1",
				noir_3 = "#B7B3AF",
				noir_4 = "#A5A19D",
				noir_5 = "#938F8B",
				noir_6 = "#817D79",
				noir_7 = "#6F6B67", -- Near comment color
				noir_8 = "#5C5854",
				noir_9 = "#323136", -- Darkest, near bg_float

				-- Semantic/diagnostic colors (retained warm tones)
				diagnostic_error = "#D66B6C", -- Red for errors
				diagnostic_warning = "#E89B6C", -- Orange for warnings
				diagnostic_info = "#7A9FC6", -- Muted blue for info
				diagnostic_hint = "#A9B87F", -- Muted olive for hints
			},
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
