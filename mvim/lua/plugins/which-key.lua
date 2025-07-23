return {
	"folke/which-key.nvim",
	opts = {
		preset = "helix",
		win = {
			title = " ",
			border = function()
				if vim.g.neovide then
					return "none"
				else
					return "rounded"
				end
			end,
		},
	},
}
