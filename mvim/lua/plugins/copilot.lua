-- This is the config file for the Copilot lsp plugin.
-- https://github.com/copilotlsp-nvim/copilot-lsp
return {
	"copilotlsp-nvim/copilot-lsp",
	init = function()
		vim.g.copilot_nes_debounce = 500
		vim.lsp.enable("copilot")
		vim.keymap.set("i", "<C-a>", function()
			require("copilot-lsp.nes").apply_pending_nes()
		end)
	end,
}
