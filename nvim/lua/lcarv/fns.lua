local M = {}

M.nmap = function(keys, func, desc)
	if desc then
		desc = "LSP: " .. desc
	end

	vim.keymap.set("n", keys, func, { desc = desc, noremap = true })
end

M.cursorStyle = function()
	-- create highlights for the different modes
	local mocha = M.colors().mocha
	vim.api.nvim_set_hl(0, "NCursor", { bg = mocha.mauve })
	vim.api.nvim_set_hl(0, "ICursor", { bg = mocha.green })
	vim.api.nvim_set_hl(0, "VCursor", { bg = mocha.red })
	vim.api.nvim_set_hl(0, "RCursor", { bg = mocha.yellow })
	vim.api.nvim_set_hl(0, "NoiceCursor", { bg = mocha.saphire })

	if mocha.mauve then
		vim.opt.guicursor =
		"n:block-NCursor,ci:block-NoiceCursor,v:block-VCursor,i-ci-ve:block-ICursor,r-cr-o:block-RCursor"
	end
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
