return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		enabled = false,
		ft = { "markdown", "codecompanion" },
		opts = {
			completions = { lsp = { enabled = true } },
			overrides = {
				buftype = {
					nofile = {
						enabled = true,
						-- code = { left_pad = 0, right_pad = 0 },
					},
				},
			},
			opts = {
				code = {
					sign = true,
					width = "block",
					right_pad = 1,
				},
				-- heading = {
				-- 	sign = false,
				-- 	icons = {},
				-- },
			},
			ft = { "markdown", "norg", "rmd", "org", "codecompanion" },
		},
	},
	{
		"OXY2DEV/markview.nvim",
		enabled = true,
		lazy = true,
		ft = { "markdown", "norg", "rmd", "org", "codecompanion", "Avante" },
		opts = function(_, opts)
			local presets = require("markview.presets")
			opts.markdown = {
				headings = presets.headings.glow,
			}
			opts.code_blocks = {
				style = "simple", -- or "fancy" for more styling
			}
			opts.preview = {
				filetypes = { "markdown", "codecompanion" },
				ignore_buftypes = {},
				modes = { "n", "i", "c", ":", "no", "io", "co" },
				hybrid_modes = { "i", "n" },
				ignore_nodes = { "fenced_code_block" },
			}
		end,
	},
}
