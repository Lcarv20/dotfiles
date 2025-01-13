local M = {}

M.cursor_style = function()
	-- create highlights for the different modes
	local colors = require("utils.colors")

	vim.api.nvim_set_hl(0, "NCursor", { bg = colors.blue })
	vim.api.nvim_set_hl(0, "ICursor", { bg = colors.green })
	vim.api.nvim_set_hl(0, "VCursor", { bg = colors.purple })
	vim.api.nvim_set_hl(0, "RCursor", { bg = colors.red })
	vim.api.nvim_set_hl(0, "ComCursor", { bg = colors.yellow })
	vim.api.nvim_set_hl(0, "NoiceCursor", { bg = colors.saphire })

	-- With lazyvim this will be overriden, so we do this in opts.
	-- However the highlights are set on vimenter using an autocmd.
	--
	-- vim.opt.guicursor =
	--   "n:block-NCursor,ci:block-NoiceCursor,v:block-VCursor,i-ci-ve:block-ICursor,r-cr-o:block-RCursor,sm:block-ComCursor"
end

local terminal_bufnr = nil
local terminal_winid = nil

M.toggle_term = function()
	if terminal_winid and vim.api.nvim_win_is_valid(terminal_winid) then
		-- If the terminal window is open, close it
		vim.api.nvim_win_close(terminal_winid, true)
		terminal_winid = nil
		return
	end

	-- If the terminal buffer doesn't exist, create it
	if not (terminal_bufnr and vim.api.nvim_buf_is_valid(terminal_bufnr)) then
		vim.cmd("botright 25split | terminal")
		terminal_bufnr = vim.api.nvim_get_current_buf()
	else
		-- If the buffer exists, reopen it in a split
		vim.cmd("botright 25split")
		vim.api.nvim_set_current_buf(terminal_bufnr)
	end

	-- Update the terminal window ID
	terminal_winid = vim.api.nvim_get_current_win()

	-- Automatically enter insert mode
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("i", true, false, true), "n", true)
end

return M
