vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- close with q for certain FileType
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = {
		"netrw",
		"Jaq",
		"qf",
		"git",
		"help",
		"man",
		"lspinfo",
		"spectre_panel",
		"lir",
		"oil",
		"DressingSelect",
		"tsplayground",
		"codecompanion",
		-- "vim",
		"",
	},
	callback = function()
		vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      nnoremap <silent> <buffer> <esc> :close<CR>
      set nobuflisted
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "*" },
	callback = function()
		local buftype = vim.bo.buftype

		if buftype == "help" then
			vim.cmd([[
		    nnoremap <silent> <buffer> q :close<CR>
		    nnoremap <silent> <buffer> <esc> :close<CR>
		    set nobuflisted
		  ]])
		end
	end,
})

-- Cursor style
vim.api.nvim_create_autocmd({ "ColorScheme", "WinEnter" }, {
	pattern = "*",
	callback = function()
		require("utils.fns").cursor_style()
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "gitcommit", "markdown", "NeogitCommitMessage" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- autocmd to set wrap and spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "gitcommit", "markdown", "NeogitCommitMessage" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- Change highlight of neogitstatus
-- This is only for everfores or themes that don't work well with Neogit
vim.api.nvim_create_autocmd("FileType", {
	pattern = "NeogitStatus",
	callback = function()
		vim.api.nvim_set_hl(0, "NeogitFold", { link = "@text.gitcommit" })
	end,
})

-- disable auto comment for XML & HTML
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "svelte" },
	callback = function()
		vim.opt_local.formatoptions:remove({ "o", "r" }) -- Disable for HTML/XML
	end,
})

-- Make terminal buffers not show up in `ls` or `vim -p`
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "term://*",
	callback = function()
		vim.bo.noswapfile = true
		vim.bo.buftype = "nofile"
	end,
})

-- disable conceal for json
vim.api.nvim_create_autocmd("FileType", {
	pattern = "json",
	callback = function()
		vim.opt_local.conceallevel = 0
	end,
})

-- Make lsp and hightlight work on .swiftinterface files, and disable diagnostics
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.swiftinterface",
	callback = function()
		vim.bo.filetype = "swift"

		vim.diagnostic.enable(false, {
			bufnr = 0,
		})

	end,
})

