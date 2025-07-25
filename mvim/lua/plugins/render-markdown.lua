return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		enabled = false,
		ft = { "markdown", "codecompanion" },
		-- opts = {
		-- 	completions = { lsp = { enabled = true } },
		-- 	overrides = {
		-- 		buftype = {
		-- 			nofile = {
		-- 				enabled = true,
		-- 				-- code = { left_pad = 0, right_pad = 0 },
		-- 			},
		-- 		},
		-- 	},
		-- 	opts = {
		-- 		code = {
		-- 			sign = false,
		-- 			width = "block",
		-- 			right_pad = 1,
		-- 		},
		-- 		-- heading = {
		-- 		-- 	sign = false,
		-- 		-- 	icons = {},
		-- 		-- },
		-- 	},
		-- 	ft = { "markdown", "norg", "rmd", "org", "codecompanion" },
		-- },
	},
	{
		"OXY2DEV/markview.nvim",
		lazy = true,
		ft = { "markdown", "norg", "rmd", "org", "codecompanion" },
		opts = function(_, opts)
			local presets = require("markview.presets")
			opts.markdown = {
				headings = presets.headings.glow,
			}
			opts.preview = {
				filetypes = { "markdown", "codecompanion" },
				ignore_buftypes = {},
				modes = { "n", "no", "c", "v", "i" },
			}
		end,
	},
}
