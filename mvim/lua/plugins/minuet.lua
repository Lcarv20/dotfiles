return {
	"milanglacier/minuet-ai.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
  enabled = false,
	config = function()
		require("minuet").setup({
			virtualtext = {
				auto_trigger_ft = { "lua", "swift", "typescript", "javascript", "typescriptreact", "javascriptreact" },
				keymap = {
					-- accept whole completion
					accept = "<C-a>",
					-- accept one line
					accept_line = "<A-a>",
					-- accept n lines (prompts for number)
					-- e.g. "A-z 2 CR" will accept 2 lines
					accept_n_lines = "<C-z>",
					-- Cycle to prev completion item, or manually invoke completion
					prev = "<A-[>",
					-- Cycle to next completion item, or manually invoke completion
					next = "<A-]>",
					dismiss = "<C-e>",
				},
			},
			provider = "openai_fim_compatible",
			provider_options = {
				gemini = {
					model = "gemini-2.0-flash-lite",
					stream = true,
					api_key = "GEMINI_API_KEY",
					optional = {
						generationConfig = {
							maxOutputTokens = 256,
						},
					},
				},
				openai_fim_compatible = {
					api_key = "TERM",
					name = "Ollama",
					end_point = "http://localhost:11434/v1/completions",
					model = "deepseek-coder-v2",
					optional = {
						max_tokens = 56,
						top_p = 0.9,
					},
				},
			},
			-- === OLLAMA ===
			-- provider = "openai_fim_compatible",
			-- n_completions = 1,
			-- context_window = 512,
			-- === === ===
		})
	end,
}
