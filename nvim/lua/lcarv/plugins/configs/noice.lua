return {
	{
		"folke/noice.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			{
				"rcarriga/nvim-notify",
				opts = {
					render = "compact",
					background_colour = "#11111b",
					top_down = false,
					level = 2,
				},
			},
		},
		config = function()
			local require = require("noice.util.lazy")

			local Msg = require("noice.ui.msg")

			local M = {}

			---@type table<string, NoiceFilter>
			M.defaults = {
				ruler = { event = Msg.events.ruler },
				message = { event = Msg.events.show },
				command = { event = Msg.events.showcmd },
				mode = { event = Msg.events.showmode },
				search = { event = Msg.events.show, kind = Msg.kinds.search_count },
			}
			return M
		end,
		opts = {
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = false,
				},
				signature = {
					enabled = false,
				},
				progress = {
					enabled = true,
					format = {
						{ "({data.progress.percentage}%) ", hl_group = "NoiceLspProgressSpinner" },
						{ " {spinner} ", hl_group = "NoiceLspProgressSpinner" },
						{ "{data.progress.title} ", hl_group = "NoiceLspProgressTitle" },
						{ "{data.progress.client} ", hl_group = "NoiceLspProgressClient" },
					},

					format_done = {
						{ " ✔ ", hl_group = "NoiceLspProgressSuccess" },
						{ "{data.progress.title} ", hl_group = "NoiceLspProgressTitle" },
						{ "{data.progress.client} ", hl_group = "NoiceLspProgressClient" },
					},
					view = "mini",
				},
			}, -- you can enable a preset for easier configuration
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
			messages = {
				-- NOTE: If you enable messages, then the cmdline is enabled automatically.
				-- This is a current Neovim limitation.
				enabled = true, -- enables the Noice messages UI
				view = "notify", -- default view for messages
				view_error = "notify", -- view for errors
				view_warn = "notify", -- view for warnings
				view_history = "messages", -- view for :messages
				view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
			},
			routes = {
				-- { filter = { event = "msg_show", find = "search hit" }, skip = true },
				-- {
				--   filter = {
				--     event = "msg_show",
				--     kind = { "wmsg", "emsg" },
				--   },
				--   opts = { skip = true },
				-- },
				-- {
				--   filter = {
				--     event = "msg_show",
				--     kind = "",
				--   },
				--   opts = { skip = true },
				-- },
			},
			redirect = {
				view = "popup",
				filter = { event = "msg_show" },
			},
			cmdline = {
				format = {
					cmdline = { pattern = "^:", icon = "_", lang = "vim" },
				},
			},
			views = {
				notify = {
					backend = "notify",
					fallback = "mini",
					format = "notify",
					replace = true,
					merge = false,
				},
				cmdline_popup = {
					position = {
						row = 3,
						col = "50%",
					},
					size = {
						width = 60,
						height = "auto",
					},
				},
				popupmenu = {
					relative = "editor",
					position = {
						row = 8,
						col = "50%",
					},
					size = {
						width = 60,
						height = 10,
					},
					border = {
						-- style = "rounded",
						padding = { 0, 1 },
					},
					win_options = {
						winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
					},
				},
			},
		},
	},
}
