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
		"vim",
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

-- Delete empty buffer on leave
vim.api.nvim_create_autocmd("BufLeave", {
	callback = function()
    print("left buffer")
		local bufnr = vim.fn.bufnr() -- Get the current buffer number
		local lines = vim.fn.getbufline(bufnr, 1, vim.fn.line("$")) -- Get all lines in the buffer

		-- Check if the buffer is empty and unmodified
		if #lines == 1 and lines[1] == "" and not vim.bo[bufnr].modified then
			vim.cmd("bwipeout " .. bufnr) -- Safely delete the buffer by its number
		end
	end,
	group = vim.api.nvim_create_augroup("DeleteEmptyBuffer", { clear = true }),
	pattern = "*",
})

