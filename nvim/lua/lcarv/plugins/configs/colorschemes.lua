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
		priority = 1000
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
		end
	},
	{
		"hachy/eva01.vim",
		branch = "main",
		lazy = false,
		priority = 1000
	},
	{
		"challenger-deep-theme/vim",
		name = "challenger-deep-theme",
		lazy = false,
		priority = 1000
	},
	{
		"embark-theme/vim",
		name = "embark",
		lazy = false,
		priority = 1000
	},
	{
		"folke/tokyonight.nvim",
		config = function()
			-- require("tokyonight").setup({
			-- 	transparent = true
			-- })
		end
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
		end
	},
	{
		"nyoom-engineering/oxocarbon.nvim",
		name = "oxocarbon",
		lazy = false,
		priority = 1000
	},
	{
		"projekt0n/github-nvim-theme",
		tag = "v0.0.7",
		config = function()
			-- require("github-theme").setup({
			-- 	theme_style = "dark_default",
			-- 	transparent = true
			-- })
		end
	},
	{
		"marko-cerovac/material.nvim",
		lazy = false,
		priority = 1000
	},
	{
		"LunarVim/Colorschemes",
		lazy = false,
		priority = 1000
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		opts = {
			transparent_background = true,
			custom_highlights = function(colors)
				local float = "#161617"
				local string = "#CE9178"
				local comment = "#6A9955"
				return {
					-- TabLineSel = { bg = colors.pink },
					-- String = { fg = string },
					-- Comment = { fg = comment },
					NeotreeNormal = { bg = float },
					NeotreeFloatBorder = { fg = float, bg = float },
					VertSplit = { bg = float, fg = float },
					WhichKeyFloat = { bg = float },
					NoiceCmdlinePopupBorder = { fg = colors.blue },
					NoiceVirtualText = { fg = colors.yellow },
					NoiceLspProgressSuccess = { fg = colors.green },
					NoiceLspProgressSpinner = { fg = colors.yellow },
					TelescopePromptNormal = {
						bg = '#18181b',
						fg = '#d6d3d1'
					},
					TelescopePromptBorder = {
						bg = '#18181b',
						fg = '#18181b',
					},
					TelescopePromptTitle = {
						-- bg = '#18181b',
						fg = '#57534e',
					},

					-- Preview
					TelescopePreviewTitle = {
						fg = '#18181b',
						bg = '#18181b',
					},
					TelescopePreviewNormal = {
						-- fg = '#18181b',
						bg = '#18181b',
					},
					TelescopePreviewBorder = {
						-- NO BORDER
						-- fg = '#1F1F23',
						-- bg = '#18181b',
						--
						-- SPECIFIC FOR BORDERLINE
						fg = '#334155',
						bg = '#18181b',
					},

					-- Results whi
					TelescopeResultsTitle = {
						fg = '#161617',
						bg = '#161617',
					},
					TelescopeResultsNormal = {
						-- fg = '#1F1F23',
						bg = '#161617',
					},
					TelescopeResultsBorder = {
						fg = '#161617',
						bg = '#161617',
					},
					NormalFloat = {
						bg = '#161617',
						fg = '#cdd6f5',
					},
					Pmenu = {
						bg = '#161617',
						fg = '#cdd6f5',
					}
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
		priority = 1000
	},
	{
		"savq/melange-nvim",
		lazy = false,
		priority = 1000
	},
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- require "nordic".load()
		end
	},
	{
		"Everblush/nvim",
		name = "everblush",
		lazy = false,
		priority = 1000
	},
	{
		"rafamadriz/neon",
		lazy = false,
		priority = 1000
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
		priority = 1000
	},
	{
		"humanoid-colors/vim-humanoid-colorscheme",
		lazy = false,
		priority = 1000
	},
	{
		'Mofiqul/dracula.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			require("dracula").setup({ overrides = {} }
			)
			require('lualine').setup {
				options = {
					theme = 'dracula-nvim'
				}
			}
		end
		,
	},
}
