return {
	"supermaven-inc/supermaven-nvim",
	config = function()
		require("supermaven-nvim").setup({
			color = {
				suggestion_color = require("utils.colors").subtle_gray,
				cterm = 244,
			},
			ignore_filetypes = { "markdown", "cpp" }, -- or { "cpp", }
			keymaps = {
				accept_suggestion = "<Tab>",
				clear_suggestion = "<C-e>",
				accept_word = "<C-j>",
			},
		})
	end,
}
