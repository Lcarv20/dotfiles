return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local themes = require("utils.configs.lualine_configs")
			require("lualine").setup(themes.lcarv_shrugged())
		end,
	},
}
