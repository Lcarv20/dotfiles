require("lcarv.plugins.lazy")
local r = function(path)
	return require("lcarv.plugins.configs." .. path)
end

require("lazy").setup({
		r("colorschemes"),
		r("telescope"),
		r("whichkey"),
		r("misc"),
		r("cmp"),
		r("lsp"),
		r("git-plugins"),
		r("treesitter"),
		r("comment"),
		r("codeium"),
		r("nvim-surround"),
		r("autopairs"),
		r("nvim-ts-autotag"),
		r("trouble"),
		r("neo-tree"),
		r("web-stuff"),
		r("none-ls"),
		-- r("noice"),
		r("indent-blankline"),
		r("dressing"),
		r("refactoring"),
		r("barbecue"),
		r("illuminate"),
		r("lualine"),
		-- r("rainbow-delimiters"),
		-- r("roll"),
	},
	{}
)
