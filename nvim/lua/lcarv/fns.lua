local M = {}
-- local status_ok, Path = pcall(require, "plenary.path")
-- if not status_ok then
-- 	return
-- end

M.nmap = function(keys, func, desc)
	if desc then
		desc = "LSP: " .. desc
	end

	vim.keymap.set("n", keys, func, { desc = desc, noremap = true })
end

M.getConfig = function()
	local Path = require("plenary").Path
	return vim.json.decode(Path:new("custom.json"):read())
end

M.toggleInlayHints = function()
	local Path = require("plenary").Path
	local isInlayActive = vim.json.decode(Path:new("custom.json"):read())["inlayHints"]

	local newConfig = {
		["inlayHints"] = not isInlayActive
	}

	Path:new("custom.json"):write(vim.json.encode(newConfig), "w")
end

return M
