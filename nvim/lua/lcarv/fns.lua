local M = {}
-- local status_ok, Path = pcall(require, "plenary.path")
-- if not status_ok then
-- 	return
-- end

local editorState = "state.json"
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
end

return M
