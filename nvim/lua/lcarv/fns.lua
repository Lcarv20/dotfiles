local M = {}
-- local status_ok, plenary = pcall(require, "plenary")
-- if not status_ok then
--return
--end
-- local status_ok, Path = pcall(require, "plenary.path")
-- if not status_ok then
-- 	return
-- end

local editorState = vim.fn.expand('$HOME') .. '/.config/nvim/state.json'
local defaultConfig = {
	["inlayHints"] = false
}

M.nmap = function(keys, func, desc)
	if desc then
		desc = "LSP: " .. desc
	end

	vim.keymap.set("n", keys, func, { desc = desc, noremap = true })
end

M.getConfig = function()
	local Path = require("plenary").Path
	local config = Path:new(editorState)

	if not config:exists() then
		Path:new(editorState):write(vim.fn.json_encode(defaultConfig), "w")
	end

	return vim.json.decode(Path:new(editorState):read())
end

M.toggleInlayHints = function()
	local Path = require("plenary").Path
	local isInlayActive = vim.json.decode(Path:new(editorState):read())["inlayHints"]

	local newConfig = {
		["inlayHints"] = not isInlayActive
	}

	Path:new(editorState):write(vim.json.encode(newConfig), "w")

	vim.lsp.inlay_hint(0)
end

M.cursorStyle = function()
	-- This only works with catppuccin on
	local mocha = M.colors().mocha
	vim.api.nvim_set_hl(0, "NorCursor", { bg = mocha.teal })
	vim.api.nvim_set_hl(0, "ICursor", { bg = mocha.green })
	vim.api.nvim_set_hl(0, "VCursor", { bg = mocha.mauve })
	vim.api.nvim_set_hl(0, "RCursor", { bg = mocha.red })
	vim.api.nvim_set_hl(0, "NoiceCursor", { bg = mocha.peach })
	vim.opt.guicursor = 'n:block-NorCursor,ci:block-NoiceCursor,v:block-VCursor,i-ci-ve:block-ICursor,r-cr-o:block-RCursor'

	-- vim.api.nvim_set_hl(0, "NorCursor", { bg = "orange" })
	-- vim.api.nvim_set_hl(0, "ICursor", { bg = "green" })
	-- vim.api.nvim_set_hl(0, "VCursor", { bg = "purple" })
	-- vim.api.nvim_set_hl(0, "RCursor", { bg = "red" })
	-- vim.api.nvim_set_hl(0, "NoiceCursor", { bg = "orange" })
	-- vim.opt.guicursor = 'n:block-NorCursor,ci:block-NoiceCursor,v:block-VCursor,i-ci-ve:block-ICursor,r-cr-o:block-RCursor'

end

M.colors = function()
	return {
		latte = require("catppuccin.palettes").get_palette "latte",
		frappe = require("catppuccin.palettes").get_palette "frappe",
		macchiato = require("catppuccin.palettes").get_palette "macchiato",
		mocha = require("catppuccin.palettes").get_palette "mocha",
	}
end

return M
