return {
	"Exafunction/windsurf.vim",
  enabled = false,
	config = function()
		-- Change '<C-g>' here to any keycode you like.
		vim.keymap.set("i", "<Tab>", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true, silent = true })
		-- vim.keymap.set("i", "<c-;>", function()
		-- 	return vim.fn["codeium#CycleCompletions"](1)
		-- end, { expr = true, silent = true })
		-- vim.keymap.set("i", "<c-,>", function()
		-- 	return vim.fn["codeium#CycleCompletions"](-1)
		-- end, { expr = true, silent = true })
		vim.keymap.set("i", "<c-e>", function()
			return vim.fn["codeium#Clear"]()
		end, { expr = true, silent = true })
	end,
}
