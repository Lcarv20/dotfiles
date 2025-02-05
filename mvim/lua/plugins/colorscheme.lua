return {
	{
		"kvrohit/rasmus.nvim",
		priority = 1000,
		config = function()
			vim.g.rasmus_italic_functions = true
			vim.g.rasmus_bold_functions = true
			-- vim.g.rasmus_variant = "monochrome"

			vim.cmd([[colorscheme rasmus]])
		end,
	},
	{
		"Lcarv20/gruber-darker.nvim",
		-- enabled = false,
		config = function()
			require("gruber-darker").setup({
				-- OPTIONAL
				-- transparent = true, -- removes the background
				underline = true, -- disables underline fonts
				bold = true, -- disables bold fonts
			})

			-- local colors = require("utils.colors")

			vim.api.nvim_set_hl(0, "BlinkCmpDoc", { link = "Pmenu", force = true })

			vim.cmd.colorscheme("gruber-darker")
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
		lazy = false,
		priority = 1000,
		config = function()
			require("ash").setup({
				-- transparent = true,
			})
			-- vim.cmd.colorscheme("ash")
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		opts = {
			styles = {
				bold = true,
				italic = true,
				transparency = true,
			},
		},
		config = function(_, opts)
			require("rose-pine").setup(opts)
			-- vim.cmd("colorscheme rose-pine-moon")
			vim.api.nvim_set_hl(0, "RenderMarkdownCode", { link = "NormalFloat" })
		end,
	},
}
