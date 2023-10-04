local M = {}

M.nmap = function(keys, func, desc)
	if desc then
		desc = "LSP: " .. desc
	end

	vim.keymap.set("n", keys, func, { desc = desc, noremap = true })
end

-- M.toggleHints() = function()
-- 	local config = json.decode(io.read("~/.config/nvim/config.json"))
-- end


return M
