return {
	{
		"b0o/incline.nvim",
    enabled = false,
		config = function()
			require("incline").setup({
				window = {
					padding = 1,
					margin = { vertical = 0, horizontal = 0 },
				},
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
					local modified = vim.bo[props.buf].modified and "bold,italic" or "bold"

					local function get_diagnostic_label()
						local icons = { error = " ", warn = " ", info = " ", hint = " " }
						local label = {}

						for severity, icon in pairs(icons) do
							local n = #vim.diagnostic.get(
								props.buf,
								{ severity = vim.diagnostic.severity[string.upper(severity)] }
							)
							if n > 0 then
								table.insert(label, { icon .. n .. " ", group = "DiagnosticSign" .. severity })
							end
						end
						if #label > 0 then
							table.insert(label, { "┊ " })
						end
						return label
					end

					local buffer = {
						{ get_diagnostic_label() },
						{ (ft_icon or "") .. " ", guifg = ft_color, guibg = "none" },
						{ filename .. " ", gui = modified },
						{ "┊  " .. vim.api.nvim_win_get_number(props.win), group = "DevIconWindows" },
					}
					return buffer
				end,
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local themes = require("utils/lualine-configs")
			require("lualine").setup(themes.lcarv_shrugged())
		end,
	},
}
