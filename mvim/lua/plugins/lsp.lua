-- LSP Plugins
return {
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
			{ "williamboman/mason.nvim", opts = {} },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			-- {
			-- 	"j-hui/fidget.nvim",
			-- 	opts = {
			-- 		notification = {
			-- 			window = {
			-- 				border = "single",
			-- 				winblend = 0,
			-- 				align = "top",
			-- 			},
			-- 		},
			-- 	},
			-- },
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

					-- Diagnostics Related
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

          -- W/out Telescope
					map("gd", vim.lsp.buf.definition, "Goto Definition")
					map("gr", vim.lsp.buf.references, "Goto References")
					map("gI", vim.lsp.buf.implementation, "Goto Implementation")
					map("gD", vim.lsp.buf.type_definition, "Type Definition")
					map("<leader>c", "", "Code")
					map("<leader>cs", vim.lsp.buf.document_symbol, "Document Symbols")
					map("<leader>cS", vim.lsp.buf.workspace_symbol, "[W]orkspace [S]ymbols")
					--

          -- W/ Telescope
					-- map("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")
					-- map("gr", require("telescope.builtin").lsp_references, "Goto References")
					-- map("gI", require("telescope.builtin").lsp_implementations, "Goto Implementation")
					-- map("gD", require("telescope.builtin").lsp_type_definitions, "Type Definition")
					-- map("<leader>c", "", "Code")
					-- map("<leader>cs", require("telescope.builtin").lsp_document_symbols, "Document Symbols")
					-- map(
					-- 	"<leader>cS",
					-- 	require("telescope.builtin").lsp_dynamic_workspace_symbols,
					-- 	"[W]orkspace [S]ymbols"
					-- )
					map("<leader>cr", vim.lsp.buf.rename, "Rename")
					map("<leader>ca", vim.lsp.buf.code_action, "Code Action", { "n", "x" })
					map("gS", vim.lsp.buf.declaration, "Goto Declaration")
					map("<leader>cd", vim.diagnostic.setloclist, "Document Diagnostics")
					map("<leader>cw", vim.diagnostic.setqflist, "Workspace Diagnostics")

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

			require("utils.fns").diagnostics_config()
			require("utils.fns").lsp_popover_borders()

			local capabilities = vim.lsp.protocol.make_client_capabilities()

			capabilities =
				vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities(capabilities))

			local servers = {
				gopls = {},
				pyright = {},
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
					workspace = {
						didChangeWatchedFiles = {
							dynamicRegistration = true,
						},
					},
				}),
				single_file_support = true,
				settings = {
					-- swiftPM = {
					-- 	swiftSDKsDirectory = "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk", -- Optional, if required
					-- },
				},
				filetypes = { "swift", "swiftinterface", "c", "cpp", "objective-c", "objective-cpp" },
			})
		end,
	},
}
