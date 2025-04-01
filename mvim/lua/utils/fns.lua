local M = {}

M.cursor_style = function()
	-- create highlights for the different modes
	local colors = require("utils.colors")
	-- local colors = require("gruber.groups")

	vim.api.nvim_set_hl(0, "NCursor", { bg = colors.blue })
	vim.api.nvim_set_hl(0, "ICursor", { bg = colors.green })
	vim.api.nvim_set_hl(0, "VCursor", { bg = colors.yellow })
	vim.api.nvim_set_hl(0, "RCursor", { bg = colors.red })
	vim.api.nvim_set_hl(0, "ComCursor", { bg = colors.cyan })
	vim.api.nvim_set_hl(0, "NoiceCursor", { bg = colors.niagara_1 })
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

-- Create a function to toggle `vim.opt.list` and update the description dynamically
M.toggle_listchars = function()
	vim.opt.list = not vim.wo.list
	local state = vim.opt.list and "enabled" or "disabled"
	print("Listchars " .. state)
end

-- Add icons to diagnostics, and configure the diagnotics message
M.diagnostics_config = function()
	if vim.g.have_nerd_font then
		local signs = { ERROR = " ", WARN = " ", INFO = " ", HINT = "" }
		local diagnostic_signs = {}
		for type, icon in pairs(signs) do
			diagnostic_signs[vim.diagnostic.severity[type]] = icon
		end
		-- vim.diagnostic.config({ signs = { text = diagnostic_signs } })

		local popup_signs = {
			{ name = "diagnosticsignerror", text = " " },
			{ name = "diagnosticsignwarn", text = " " },
			{ name = "diagnosticsigninfo", text = " " },
			{ name = "diagnosticsignhint", text = "" },
		}

		for _, sign in ipairs(popup_signs) do
			vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
		end

		local default_diagnostic_config = {
			signs = {
				active = popup_signs,
				text = diagnostic_signs,
			},
			-- virtual_text = {
			-- 	prefix = "⏺",
			-- },
      virtual_lines = true,
			update_in_insert = false,
			underline = true,
			severity_sort = true,
			float = {
				focusable = true,
				max_width = 80,
				max_height = 20,
				style = "minimal",
				border = "single",
				source = "always",
				wrap = true,
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

					local sign = popup_signs[diagnostic.severity].text
					local hl = popup_signs[diagnostic.severity].name

					return string.format("%s%s [%s,%s] ", sign, get_i(), get_lnum_range(), get_col_range()), hl
				end,
			},
		}

		vim.diagnostic.config(default_diagnostic_config)

		for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config() or {}, "signs", "values") or {}) do
			vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
		end
	end
end

-- Configure the LSP hover and signature help popups borders
M.lsp_popover_borders = function()
	local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
	---@diagnostic disable-next-line: duplicate-set-field
	function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
		opts = opts or {}
		opts.border = opts.border or "single"
		return orig_util_open_floating_preview(contents, syntax, opts, ...)
	end
end

M.open_floating_window = function(bufnr)
	bufnr = bufnr or vim.api.nvim_get_current_buf()

	local width = vim.o.columns
	local height = vim.o.lines

	local float_width = math.floor(width * 0.9)
	local float_height = math.floor(height * 0.9)

	local col = math.floor((width - float_width) / 2)
	local row = math.floor((height - float_height) / 2)

	local opts = {
		relative = "editor",
		width = float_width,
		height = float_height,
		col = col,
		row = row,
		style = "minimal",
		border = "single", -- Options: "none", "single", "double", "rounded", etc.
	}

	-- local buf = vim.api.nvim_create_buf(false, true) -- Create a scratch buffer
	vim.api.nvim_open_win(bufnr, true, opts) -- Open the floating window
end

--- Create a temporary notification using mini.notify.
-- This function displays a notification message with a specified level and automatically removes it after a delay.
-- @param msg The notification message to display.
-- @param level "INFO" | "WARN" | "ERROR" | "DEBUG": The level of the notification
-- @param delay number: (optional) The delay in milliseconds before removing the notification. Defaults to 2500.
---@type fun(msg: string, level: "'INFO'" | "'WARN'" | "'ERROR'" | "'DEBUG'", delay?: number)
M.create_notification = function(msg, level, delay)
	delay = delay or 2500 -- Use the provided delay or default to 2500

	local hl = level == "INFO" and "DiagnosticInfo"
		or level == "WARN" and "DiagnosticWarn"
		or level == "ERROR" and "DiagnosticError"
		or "DiagnosticHint"

	local id = require("mini.notify").add(msg, level, hl)
	vim.defer_fn(function()
		require("mini.notify").remove(id)
	end, delay)
end

M.is_maximized = false
M.original_sizes = {}

M.toggle_maximize = function()
	if not M.is_maximized then
		-- Save original sizes of all splits
		M.original_sizes = vim.api.nvim_tabpage_list_wins(0)
		for _, win in ipairs(M.original_sizes) do
			local win_width = vim.api.nvim_win_get_width(win)
			local win_height = vim.api.nvim_win_get_height(win)
			vim.api.nvim_win_set_var(win, "original_size", { width = win_width, height = win_height })
		end
		-- Maximize current split
		vim.cmd("resize | vertical resize")
		M.is_maximized = true
	else
		-- Restore original sizes
		for _, win in ipairs(M.original_sizes) do
			local size = vim.api.nvim_win_get_var(win, "original_size")
			vim.api.nvim_win_set_width(win, size.width)
			vim.api.nvim_win_set_height(win, size.height)
		end

		M.is_maximized = false
	end
end

return M
