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
	-- create highlights for the different modes
	local mocha = M.colors().mocha
	vim.api.nvim_set_hl(0, "NCursor", { bg = mocha.mauve })
	vim.api.nvim_set_hl(0, "ICursor", { bg = mocha.green })
	vim.api.nvim_set_hl(0, "VCursor", { bg = mocha.red })
	vim.api.nvim_set_hl(0, "RCursor", { bg = mocha.yellow })
	vim.api.nvim_set_hl(0, "NoiceCursor", { bg = mocha.saphire })
	vim.opt.guicursor = 'n:block-NCursor,ci:block-NoiceCursor,v:block-VCursor,i-ci-ve:block-ICursor,r-cr-o:block-RCursor'
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
