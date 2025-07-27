return {
	"saghen/blink.cmp",
	-- enabled = false,
	dependencies = {
		"rafamadriz/friendly-snippets",
		"Kaiser-Yang/blink-cmp-avante",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
		},
	},
	version = "*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "enter",
			["<Tab>"] = {
				"snippet_forward",
				"fallback",
			},
			["<S-Tab>"] = { "snippet_backward", "fallback" },
		},
		cmdline = {
			keymap = {
				preset = "inherit",
				["<Tab>"] = { "show_and_insert", "select_next" },
				["<S-Tab>"] = { "show_and_insert", "select_prev" },

				["<C-space>"] = { "show", "fallback" },

				["<C-n>"] = { "select_next", "fallback" },
				["<C-p>"] = { "select_prev", "fallback" },
				["<Right>"] = { "select_next", "fallback" },
				["<Left>"] = { "select_prev", "fallback" },

				["<C-y>"] = { "select_and_accept" },
				["<C-e>"] = { "cancel" },
			},
		},
		completion = {
			menu = {
				-- auto_show = true,
				auto_show = function(ctx)
					-- if ctx.mode == "cmdline" then
					-- end
					return ctx.mode ~= "cmdline" or not vim.tbl_contains({ "/", "?", ":%" }, vim.fn.getcmdtype())
				end,
			},
			list = {
				selection = {
					preselect = false,
					auto_insert = false,
				},
			},

			documentation = {
				auto_show = true,
				auto_show_delay_ms = 300,
				-- window = { border = "single" },
			},

			-- Display a preview of the selected item on the current line
			ghost_text = { enabled = true },
		},

		appearance = {
			-- Sets the fallback highlight groups to nvim-cmp's highlight groups
			-- Useful for when your theme doesn't support blink.cmp
			-- Will be removed in a future release
			use_nvim_cmp_as_default = true,
			-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "avante", "lsp", "path", "snippets", "buffer" },
			providers = {
				avante = {
					module = "blink-cmp-avante",
					name = "Avante",
					opts = {
						-- options for blink-cmp-avante
					},
				},
			},
		},
	},
	opts_extend = { "sources.default" },
}
