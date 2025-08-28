-- This is the config file for the Copilot lsp plugin.
-- https://github.com/copilotlsp-nvim/copilot-lsp
return {
	"copilotlsp-nvim/copilot-lsp",
	enabled = false,
	init = function()
		vim.g.copilot_nes_debounce = 500
		vim.lsp.enable("copilot_ls")
		vim.keymap.set("n", "<tab>", function()
			local bufnr = vim.api.nvim_get_current_buf()
			local state = vim.b[bufnr].nes_state
			if state then
				-- Try to jump to the start of the suggestion edit.
				-- If already at the start, then apply the pending suggestion and jump to the end of the edit.
				local _ = require("copilot-lsp.nes").walk_cursor_start_edit()
					or (
						require("copilot-lsp.nes").apply_pending_nes()
						and require("copilot-lsp.nes").walk_cursor_end_edit()
					)
				return nil
			else
				-- Resolving the terminal's inability to distinguish between `TAB` and `<C-i>` in normal mode
				return "<C-a>"
			end
		end, { desc = "Accept Copilot NES suggestion", expr = true })
		-- Clear copilot suggestion with Esc if visible, otherwise preserve default Esc behavior
		-- vim.keymap.set("n", "<esc>", function()
		-- 	if not require("copilot-lsp.nes").clear() then
		-- 	end
		-- end, { desc = "Clear Copilot suggestion or fallback" })
	end,
	opts = {
		filetypes = {
			yaml = false,
			markdown = false,
			json = false,
		},
		server_opts_overrides = {
			settings = {
				telemetry = {
					telemetryLevel = "off",
				},
			},
		},
	},
}
