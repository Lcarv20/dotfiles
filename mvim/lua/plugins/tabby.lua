---@class Snacks
---@diagnostic disable-next-line: undefined-global

return {
	"nanozuki/tabby.nvim",
	enabled = true,
	config = function()
		-- Keymaps
		vim.keymap.set("n", "<leader>t", "", { desc = "tabs" })
		vim.keymap.set("n", "<leader>tn", ":tabnew<cr>", { desc = "new" })
		vim.keymap.set("n", "<leader>tc", ":tabclose<cr>", { desc = "close" })
		vim.keymap.set("n", "<leader>tr", function()
			Snacks.input({
				prompt = "new tab name: ",
			}, function(new_name)
				if new_name and new_name ~= "" then
					vim.cmd("Tabby rename_tab " .. new_name)
				else
					vim.cmd("Tabby rename_tab")
				end
			end)
		end, { desc = "rename" })

		-- Options
		vim.o.showtabline = 1

		local theme = {
			fill = "Normal",
			-- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
			head = "TabLine",
			current_tab = "CursorColumn",
			tab = "ColorColumn",
			win = "TabLine",
			tail = "TabLine",
		}

		vim.api.nvim_set_hl(0, "TabLineFill", { link = "Normal" })
		require("tabby").setup({
			line = function(line)
				return {
					{
						{ "  ", hl = theme.current_tab },
						line.sep(" ", theme.current_tab, theme.fill),
					},
					line.tabs().foreach(function(tab)
						local hl = tab.is_current() and theme.current_tab or theme.tab
						return {
							line.sep(" ", hl, theme.fill),
							tab.is_current() and "" or "󰆣",
							tab.number(),
							tab.name(),
							-- tab.close_btn(""),
							line.sep(" ", hl, theme.fill),
							hl = hl,
							margin = " ",
						}
					end),
					line.spacer(),
					-- line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
					-- 	return {
					-- 		line.sep("", theme.win, theme.fill),
					-- 		win.is_current() and "" or "",
					-- 		win.buf_name(),
					-- 		line.sep(" ", theme.win, theme.fill),
					-- 		hl = theme.win,
					-- 		margin = " ",
					-- 	}
					-- end),
					-- {
					-- 	line.sep(" ", theme.tail, theme.fill),
					-- 	{ "  ", hl = theme.tail },
					-- },
					-- hl = theme.fill,
				}
			end,
			-- option = {}, -- setup modules' option,
		})
	end,
}
