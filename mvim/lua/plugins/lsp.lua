-- LSP Plugins
return {
	{
		"b0o/SchemaStore.nvim",
		lazy = true,
		version = false, -- last release is way too old
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			inlay_hints = { enabled = false },
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true },
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", opts = {
				ui = {
					border = "double",
				},
			} },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"saghen/blink.cmp",
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. (desc or "") })
					end

					-- Diagnostics Related
					map("<c-k>", vim.lsp.buf.signature_help, "Signature Help", "i")
					map("gK", vim.lsp.buf.signature_help, "Signature Help")
					map("K", vim.lsp.buf.hover, "Hover")
					map("]d", function()
						vim.diagnostic.jump({ count = 1, float = true })
					end, "Next Diagnostic")
					map("[d", function()
						vim.diagnostic.jump({ count = -1, float = true })
					end, "Prev Diagnostic")
					map("gl", vim.diagnostic.open_float, "Line Diagnostics")

					-- map("gd", vim.lsp.buf.definition, "Goto Definition")
					-- map("gr", vim.lsp.buf.references, "Goto References")
					-- map("gI", vim.lsp.buf.implementation, "Goto Implementation")
					-- map("gD", vim.lsp.buf.type_definition, "Type Definition")
					map("<leader>c", "", "Code")
					map("<leader>cs", vim.lsp.buf.document_symbol, "Document Symbols")
					map("<leader>cS", vim.lsp.buf.workspace_symbol, "[W]orkspace [S]ymbols")

					map("<leader>cr", vim.lsp.buf.rename, "Rename")
					map("<leader>ca", vim.lsp.buf.code_action, "Code Action", { "n", "x" })
					-- map("gS", vim.lsp.buf.declaration, "Goto Declaration")
					map("<leader>cd", vim.diagnostic.setloclist, "Document Diagnostics")
					map("<leader>cw", vim.diagnostic.setqflist, "Workspace Diagnostics")

					-- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
					local function client_supports_method(client, method, bufnr)
						if vim.fn.has("nvim-0.11") == 1 then
							return client:supports_method(method, bufnr)
						else
							return client.supports_method(method, { bufnr = bufnr })
						end
					end

					-- The following two autocommands are used to highlight references of the
					-- word under your cursor when your cursor rests there for a little while.
					--    See `:help CursorHold` for information about when this is executed
					--
					-- When you move your cursor, the highlights will be cleared (the second autocommand).
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if
						client
						and client_supports_method(
							client,
							vim.lsp.protocol.Methods.textDocument_documentHighlight,
							event.buf
						)
					then
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
				end,
			})

			require("utils.fns").diagnostics_config()
			require("utils.fns").lsp_popover_borders()

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			}

			capabilities =
				vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities(capabilities))

			local servers = {
				gopls = {},
				pyright = {},
				jsonls = {
					-- lazy-load schemastore when needed
					on_new_config = function(new_config)
						new_config.settings.json.schemas = new_config.settings.json.schemas or {}
						vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
					end,
					settings = {
						json = {
							format = {
								enable = true,
							},
							validate = { enable = true },
						},
					},
				},
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
				lua_ls = {
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

			-- For now swift has to be configured seperatly because Mason doesn't have sourcekit lsp
			require("lspconfig").sourcekit.setup({
				-- https://www.swift.org/documentation/articles/zero-to-swift-nvim.html#language-server-support
				capabilities = vim.tbl_deep_extend("force", capabilities, {
					worspace = {
						didChangeWatchedFiles = {
							dynamicRegistration = true,
						},
					},
				}),
				single_file_support = true,
			})
		end,
	},
}
