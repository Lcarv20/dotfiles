return {
	"MeanderingProgrammer/render-markdown.nvim",
	-- enabled = false,
	opts = {
		overrides = {
			buftype = {
				nofile = {
					enabled = false,
					code = { left_pad = 0, right_pad = 0 },
				},
			},
		},
		opts = {
			code = {
				sign = false,
				width = "block",
				right_pad = 1,
			},
			heading = {
				sign = false,
				icons = {},
			},
		},
		ft = { "markdown", "norg", "rmd", "org", "codecompanion" },
	},
}
