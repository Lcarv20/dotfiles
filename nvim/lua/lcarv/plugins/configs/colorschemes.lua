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
	-- {
	-- 	"https://github.com/RRethy/nvim-base16",
	-- 	lazy = false,
	-- 	priority = 1000
	-- },
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
			require("tokyonight").setup({
				transparent = true
			})
		end
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				dim_nc_background = false,
				disable_background = true,
			})
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
			require("github-theme").setup({
				theme_style = "dark_default",
				transparent = true
			})
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
		opts = {
			transparent_background = true,
			custom_highlights = function(colors)
				local float = "#161617"
				local string = "#CE9178"
				local comment = "#6A9955"
				return {
					-- Comment = { fg = colors.flamingo },
					TabLineSel = { bg = colors.pink },
					-- CmpBorder = { fg = colors.surface2 },
					-- Pmenu = { bg = colors.none },
					String = { fg = string },
					Comment = { fg = comment },
					NeotreeNormal = { bg = float },
					NeotreeFloatBorder = { fg = float, bg = float },
					VertSplit = { bg = float, fg = float },
					WhichKeyFloat = { bg = float },
					-- noice
					NoiceCmdlinePopupBorder = { fg = colors.blue },
					NoiceVirtualText = { fg = colors.yellow },
					NoiceLspProgressSuccess = { fg = colors.green },
					NoiceLspProgressSpinner = { fg = colors.yellow },
				}
			end,
			integrations = {
				-- fidgets = false,
				cmp = false,
				gitsigns = true,
				neotree = false,
				treesitter = true,
				notify = true,
				noice = true,
			},
		},
		priority = 1000,
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
		config = function()
			require("bluloco").setup({
				style       = "auto", -- "auto" | "dark" | "light"
				transparent = false,
				italics     = false,
				terminal    = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
				guicursor   = true,
			})
		end,
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

}
