return {
	dir = "~/Developer/nvim_plugins/gemineovim.nvim",
	lazy = true,
	cmd = "Gemineovim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("gemineovim").setup()
	end,
}
