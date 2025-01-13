-- LSP Plugins
return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true },
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", opts = {} },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{
				"j-hui/fidget.nvim",
				opts = {
					notification = {
						window = {
							border = "single",
							winblend = 0,
							align = "top",
						},
					},
				},
			},
			-- "hrsh7th/cmp-nvim-lsp",
			"saghen/blink.cmp",
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					-- Copied from lazyvim
					local diagnostic_goto = function(next, severity)
						local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
						severity = severity and vim.diagnostic.severity[severity] or nil
						return function()
							go({ severity = severity })
						end
					end

					-- Diagnostics
					map("<c-k>", vim.lsp.buf.signature_help, "Signature Help", { mode = "i" })
					map("gK", vim.lsp.buf.signature_help, "Signature Help")
					map("K", vim.lsp.buf.hover, "Hover")
					map("]d", diagnostic_goto(true), "Next Diagnostic")
					map("[d", diagnostic_goto(false), "Prev Diagnostic")
					map("]e", diagnostic_goto(true, "ERROR"), "Next Error")
					map("[e", diagnostic_goto(false, "ERROR"), "Prev Error")
					map("]w", diagnostic_goto(true, "WARN"), "Next Warning")
					map("[w", diagnostic_goto(false, "WARN"), "Prev Warning")
					map("gl", vim.diagnostic.open_float, "Line Diagnostics")

					-- LSP
					map("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")
					map("gr", require("telescope.builtin").lsp_references, "Goto References")
					map("gI", require("telescope.builtin").lsp_implementations, "Goto Implementation")
					map("gD", require("telescope.builtin").lsp_type_definitions, "Type Definition")
					map("<leader>c", '', "Code")
					map("<leader>cs", require("telescope.builtin").lsp_document_symbols, "Document Symbols")
					map(
						"<leader>cS",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"[W]orkspace [S]ymbols"
					)
					map("<leader>cr", vim.lsp.buf.rename, "Rename")
					map("<leader>ca", vim.lsp.buf.code_action, "Code Action", { "n", "x" })
					map("gS", vim.lsp.buf.declaration, "Goto Declaration")

					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
						local highlight_augroup =
							vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
							end,
						})
					end

					if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
						map("<leader>uh", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
						end, "Toggle Inlay Hints")
					end
				end,
			})

			if vim.g.have_nerd_font then
				-- local signs = { ERROR = " ", WARN = " ", INFO = " ", HINT = "" }
				-- local diagnostic_signs = {}
				-- for type, icon in pairs(signs) do
				-- 	diagnostic_signs[vim.diagnostic.severity[type]] = icon
				-- end
				-- vim.diagnostic.config({ signs = { text = diagnostic_signs } })

				local signs = {
					{ name = "diagnosticsignerror", text = " " },
					{ name = "diagnosticsignwarn", text = " " },
					{ name = "diagnosticsigninfo", text = " " },
					{ name = "diagnosticsignhint", text = " " },
				}

				for _, sign in ipairs(signs) do
					vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
				end

				local default_diagnostic_config = {
					signs = {
						active = signs,
					},
					virtual_text = {
						prefix = "⏺",
					},
					update_in_insert = false,
					underline = true,
					severity_sort = true,
					float = {
						focusable = true,
						style = "minimal",
						border = "single",
						source = "always",
						header = "",
						prefix = function(diagnostic, i, total)
							local function get_i()
								if total > 1 then
									return " " .. i .. ")"
								end
								return ""
							end

							local get_lnum_range = function()
								if diagnostic.lnum ~= diagnostic.end_lnum then
									return diagnostic.lnum + 1 .. ":" .. diagnostic.end_lnum + 1
								end
								return diagnostic.lnum + 1
							end

							local get_col_range = function()
								if diagnostic.col ~= diagnostic.end_col then
									return diagnostic.col .. ":" .. diagnostic.end_col
								end
								return diagnostic.col
							end

							local sign = signs[diagnostic.severity].text
							local hl = signs[diagnostic.severity].name

							return string.format("%s%s [%s,%s] ", sign, get_i(), get_lnum_range(), get_col_range()), hl
						end,
					},
				}

				vim.diagnostic.config(default_diagnostic_config)

				for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config() or {}, "signs", "values") or {}) do
					vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
				end
			end

			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "single",
				max_width = 80,
				max_height = 20,
			})

			vim.lsp.handlers["textDocument/signatureHelp"] =
				vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single", max_width = 80, max_height = 20 })

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			-- CMP
			-- capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
			-- BLINK
			capabilities =
				vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities(capabilities))

			local servers = {
				clangd = {},
				gopls = {},
				pyright = {},
				rust_analyzer = {},
				swift_mesonls = {},
				lua_ls = {
					-- cmd = { ... },
					-- filetypes = { ... },
					-- capabilities = {},
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
							diagnostics = { disable = { "missing-fields" } },
						},
					},
				},
			}

			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua", -- Used to format Lua code
			})

			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			---@dignostic disable-next-line: missing-fields
			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
			-- Configure sourcekit-lsp here, without nesting in `servers`
			require("lspconfig").sourcekit.setup({
				capabilities = capabilities,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			inlay_hints = { enabled = false },
			servers = {
				cssls = {
					settings = {
						scss = {
							validate = true,
							lint = {
								unknownAtRules = "ignore",
							},
						},
						less = {
							validate = true,
							lint = {
								unknownAtRules = "ignore",
							},
						},
						css = {
							validate = true,
							lint = {
								unknownAtRules = "ignore",
							},
						},
					},
				},
				sourcekit = {},
				swift_mesonlsp = {},
			},
		},
	},
}
