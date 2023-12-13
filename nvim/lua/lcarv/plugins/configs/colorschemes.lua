return {
	{
		-- Theme inspired by Atom
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"Mofiqul/vscode.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"https://github.com/rose-pine/neovim",
		lazy = false,
		priority = 1000,
	},
	{
		"wadackel/vim-dogrun",
		lazy = false,
		priority = 1000,
	},
	{
		"Shatur/neovim-ayu",
		config = function()
			-- require("ayu").setup({
			-- 	mirage = false,
			-- 	overrides = {}
			-- })
		end,
	},
	{
		"hachy/eva01.vim",
		branch = "main",
		lazy = false,
		priority = 1000,
	},
	{
		"challenger-deep-theme/vim",
		name = "challenger-deep-theme",
		lazy = false,
		priority = 1000,
	},
	{
		"embark-theme/vim",
		name = "embark",
		lazy = false,
		priority = 1000,
	},
	{
		"folke/tokyonight.nvim",
		config = function()
			-- require("tokyonight").setup({
			-- 	transparent = true
			-- })
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		config = function()
			-- require("rose-pine").setup({
			-- 	dim_nc_background = false,
			-- 	disable_background = true,
			-- })
		end,
	},
	{
		"nyoom-engineering/oxocarbon.nvim",
		name = "oxocarbon",
		lazy = false,
		priority = 1000,
	},
	{
		"projekt0n/github-nvim-theme",
		tag = "v0.0.7",
		config = function()
			-- require("github-theme").setup({
			-- 	theme_style = "dark_default",
			-- 	transparent = true
			-- })
		end,
	},
	{
		"marko-cerovac/material.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"LunarVim/Colorschemes",
		lazy = false,
		priority = 1000,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		opts = {
			-- transparent_background = true,
			custom_highlights = function(colors)
				local float = "#161617"
				return {
					NeotreeNormal = { bg = float },
					NeotreeFloatBorder = { fg = float, bg = float },
					VertSplit = { bg = float, fg = float },
					WhichKeyFloat = { bg = float },
					NoiceCmdlinePopupBorder = { fg = colors.blue },
					NoiceVirtualText = { fg = colors.yellow },
					NoiceLspProgressSuccess = { fg = colors.green },
					NoiceLspProgressSpinner = { fg = colors.yellow },
					TelescopePromptNormal = {
						bg = "#18181b",
						fg = "#d6d3d1",
					},
					TelescopePromptBorder = {
						bg = "#18181b",
						fg = "#18181b",
					},
					TelescopePromptTitle = {
						-- bg = '#18181b',
						fg = "#57534e",
					},

					-- Preview
					TelescopePreviewTitle = {
						fg = "#18181b",
						bg = "#18181b",
					},
					TelescopePreviewNormal = {
						-- fg = '#18181b',
						bg = "#18181b",
					},
					TelescopePreviewBorder = {
						-- NO BORDER
						-- fg = '#1F1F23',
						-- bg = '#18181b',
						--
						-- SPECIFIC FOR BORDERLINE
						fg = "#334155",
						bg = "#18181b",
					},

					-- Results whi
					TelescopeResultsTitle = {
						fg = "#161617",
						bg = "#161617",
					},
					TelescopeResultsNormal = {
						-- fg = '#1F1F23',
						bg = "#161617",
					},
					TelescopeResultsBorder = {
						fg = "#161617",
						bg = "#161617",
					},
					NormalFloat = {
						bg = "#161617",
						fg = "#cdd6f5",
					},
					Pmenu = {
						bg = "#161617",
						fg = "#cdd6f5",
					},
				}
			end,
			integrations = {
				cmp = false,
				gitsigns = true,
				neotree = false,
				treesitter = true,
				notify = true,
				noice = true,
				harpoon = true,
				illuminate = true,
				mason = true,
				neogit = true,
				symbols_outline = true,
				lsp_trouble = true,
				which_key = true,
				barbecue = {
					dim_dirname = true,
					bold_basename = true,
					dim_context = false,
					alt_background = false,
				},
				telescope = true,
				indent_blankline = {
					enabled = true,
					colored_indent_levels = false,
				},
				navic = {
					enabled = true,
				},
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
				},
			},
		},
	},
	{
		"nyoom-engineering/nyoom.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"savq/melange-nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			-- This callback can be used to override the colors used in the palette.
			on_palette = function(palette)
				return palette
			end,
			-- Enable bold keywords.
			bold_keywords = false,
			-- Enable italic comments.
			italic_comments = true,
			-- Enable general editor background transparency.
			transparent_bg = false,
			-- Enable brighter float border.
			bright_border = false,
			-- Reduce the overall amount of blue in the theme (diverges from base Nord).
			reduced_blue = true,
			-- Swap the dark background with the normal one.
			swap_backgrounds = false,
			-- Override the styling of any highlight group.
			override = {},
			-- Cursorline options.  Also includes visual/selection.
			cursorline = {
				-- Bold font in cursorline.
				bold = false,
				-- Bold cursorline number.
				bold_number = true,
				-- Avialable styles: 'dark', 'light'.
				theme = "dark",
				-- Blending the cursorline bg with the buffer bg.
				blend = 0.7,
			},
			noice = {
				-- Available styles: `classic`, `flat`.
				style = "flat",
			},
			telescope = {
				-- Available styles: `classic`, `flat`.
				style = "flat",
			},
			leap = {
				-- Dims the backdrop when using leap.
				dim_backdrop = false,
			},
			ts_context = {
				-- Enables dark background for treesitter-context window
				dark_background = true,
			},
		},
		config = function()
			-- require "nordic".load()
		end,
	},
	{
		"Everblush/nvim",
		name = "everblush",
		lazy = false,
		opts = {
			-- Default options
			override = {},
			transparent_background = false,
			nvim_tree = {
				contrast = false,
			},
		},
		priority = 1000,
	},
	{
		"rafamadriz/neon",
		lazy = false,
		priority = 1000,
	},
	{
		"uloco/bluloco.nvim",
		lazy = false,
		priority = 1000,
		dependencies = { "rktjmp/lush.nvim" },
		-- config = function()
		-- 	require("bluloco").setup({
		-- 		style       = "auto", -- "auto" | "dark" | "light"
		-- 		transparent = false,
		-- 		italics     = false,
		-- 		terminal    = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
		-- 		guicursor   = true,
		-- 	})
		-- end,
	},
	{
		"JoosepAlviste/palenightfall.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"humanoid-colors/vim-humanoid-colorscheme",
		lazy = false,
		priority = 1000,
	},
	{
		"Mofiqul/dracula.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("dracula").setup { overrides = {} }
			require("lualine").setup {
				options = {
					theme = "dracula-nvim",
				},
			}
		end,
	},
	{
		{
			"ribru17/bamboo.nvim",
			lazy = false,
			priority = 1000,
			config = function()
				-- Lua
				require("bamboo").setup {
					-- Main options --
					-- NOTE: to use the light theme, set `vim.o.background = 'light'`
					style = "vulgaris",                                       -- Choose between 'vulgaris' (regular), 'multiplex' (greener), and 'light'
					toggle_style_key = nil,                                   -- Keybind to toggle theme style. Leave it nil to disable it, or set it to a string, e.g. "<leader>ts"
					toggle_style_list = { "vulgaris", "multiplex", "light" }, -- List of styles to toggle between
					transparent = false,                                      -- Show/hide background
					dim_inactive = false,                                     -- Dim inactive windows/buffers
					term_colors = true,                                       -- Change terminal color as per the selected theme style
					ending_tildes = false,                                    -- Show the end-of-buffer tildes. By default they are hidden
					cmp_itemkind_reverse = false,                             -- reverse item kind highlights in cmp menu

					-- Change code style ---
					-- Options are italic, bold, underline, none
					-- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
					code_style = {
						comments = "italic",
						conditionals = "italic",
						keywords = "none",
						functions = "none",
						namespaces = "italic",
						parameters = "italic",
						strings = "none",
						variables = "none",
					},

					-- Lualine options --
					lualine = {
						transparent = false, -- lualine center bar transparency
					},

					-- Custom Highlights --
					colors = {},     -- Override default colors
					highlights = {}, -- Override highlight groups

					-- Plugins Config --
					diagnostics = {
						darker = false,    -- darker colors for diagnostic
						undercurl = true,  -- use undercurl instead of underline for diagnostics
						background = true, -- use background color for virtual text
					},
				}

				-- require('bamboo').load()
			end,
		},
	},
	{
		"zootedb0t/citruszest.nvim",
		lazy = false,
		opts = {
			option = {
				transparent = false, -- Enable/Disable transparency
				italic = true,
				bold = true,
			},
			-- Override default highlight style in this table
			-- E.g If you want to override `Constant` highlight style
			style = {
				-- This will change Constant foreground color and make it bold.
				-- Constant = { fg = "#FFFFFF", bold = true }
			},
		},
		priority = 1000,
	},
	{
		"gosukiwi/vim-atom-dark",
	},
	{
		"LunarVim/primer.nvim",
		lazy = false,    -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
	},
}
