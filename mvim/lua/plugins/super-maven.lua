return {
	"supermaven-inc/supermaven-nvim",
	config = function()
		require("supermaven-nvim").setup({
			color = {
				suggestion_color = "#736b6b",
				cterm = 244,
			},
			keymaps = {
				accept_suggestion = "<Tab>",
				clear_suggestion = "<C-e>",
				accept_word = "<C-j>",
			},
		})
	end,
}
