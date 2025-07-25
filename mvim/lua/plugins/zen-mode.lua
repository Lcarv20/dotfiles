return {
  enabled = false,
	"folke/zen-mode.nvim",
	opts = {},
	config = function()
		vim.keymap.set("n", "<leader>uz", ":ZenMode<CR>", { noremap = true })
	end,
}
