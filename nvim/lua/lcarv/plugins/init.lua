require("lcarv.plugins.lazy")
local r = function(path)
	return require("lcarv.plugins.configs." .. path)
end

require("lazy").setup({
		r("telescope"),
		r("whichkey"),
		r("misc"),
		r("cmp"),
		r("lsp"),
		r("colorschemes"),
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
		r("noice"),
		r("indent-blankline"),
		r("dressing"),
		r("refactoring"),
		r("barbecue"),
	},
	{}
)
