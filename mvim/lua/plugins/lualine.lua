return {
	{
		"b0o/incline.nvim",
		config = function()
			require("incline").setup({
				window = {
					placement = {
						-- horizontal = "center",
					},
					padding = 1,
					margin = { vertical = 0, horizontal = 0 },
				},
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
					local modified = vim.bo[props.buf].modified and "bold,italic" or "bold"

					local function get_git_diff()
						local icons = { removed = " ", changed = " ", added = " " }
						icons["changed"] = icons.modified
						local signs = vim.b[props.buf].gitsigns_status_dict
						local labels = {}
						if signs == nil then
							return labels
						end

						local hl_group = {
							added = "DiffAdd",
							changed = "DiffChange",
							removed = "DiffDelete",
						}

						for name, icon in pairs(icons) do
							if tonumber(signs[name]) and signs[name] > 0 then
								table.insert(labels, { icon .. signs[name] .. " ", group = hl_group[name] })
							end
						end
						if #labels > 0 then
							table.insert(labels, { "┊ " })
						end
						return labels
					end
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
						-- { get_git_diff() },
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
			require("lualine").setup(themes.eviline())
		end,
	},
	-- {
	-- 	"nvim-lualine/lualine.nvim",
	-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- 	config = function()
	-- 		local recording = {
	-- 			function()
	-- 				return vim.fn.reg_recording()
	-- 			end,
	-- 			icon = "󰑊",
	-- 			color = { fg = "#222222", bg = "#ffb3b3", gui = "bold" }, -- pastel red bg, dark gray fg
	-- 			separator = { right = "", left = "" },
	-- 			left_padding = 2,
	-- 		}
	--
	-- 		local recorded = {
	-- 			function()
	-- 				return vim.fn.reg_recorded()
	-- 			end,
	-- 			icon = "󰐊",
	-- 			color = { fg = "#222222", bg = "#b3ffb3", gui = "bold" }, -- pastel green bg, dark gray fg
	-- 			separator = { right = "", left = "" },
	-- 		}
	--
	-- 		local hex_bg = string.format("#%06x", vim.api.nvim_get_hl(0, { name = "Normal" }).bg)
	--
	-- 		require("lualine").setup({
	-- 			options = {
	-- 				theme = "auto", -- Or your preferred theme
	-- 				component_separators = { right = "", left = "" },
	-- 				section_separators = { left = "", right = "" },
	--
	-- 				disabled_filetypes = {
	-- 					statusline = {},
	-- 					winbar = {},
	-- 				},
	-- 				always_divide_middle = true,
	-- 			},
	-- 			sections = {
	-- 				lualine_a = { "mode" },
	-- 				lualine_b = {
	-- 					{
	-- 						"branch",
	-- 						color = { bg = hex_bg },
	-- 					},
	-- 				},
	-- 				lualine_c = {
	-- 					"%=",
	-- 					recording,
	-- 					recorded,
	-- 				},
	-- 				lualine_x = {
	-- 					{
	-- 						require("utils.codecompanion_spinner"),
	-- 						separator = { right = "" },
	-- 						icon = { " ", align = "left" },
	-- 						color = { bg = hex_bg },
	-- 					},
	-- 				},
	-- 				lualine_y = { "location" },
	-- 				lualine_z = { "progress" },
	-- 			},
	-- 			inactive_sections = {
	-- 				lualine_a = {},
	-- 				lualine_b = {},
	-- 				lualine_c = { "filename" },
	-- 				lualine_x = { "location" },
	-- 				lualine_y = {},
	-- 				lualine_z = {},
	-- 			},
	-- 			-- tabline = function()
	-- 			-- 	if #vim.api.nvim_list_tabpages() > 1 then
	-- 			-- 		return {
	-- 			-- 			lualine_a = {
	-- 			-- 				{
	-- 			-- 					"tabs",
	-- 			-- 					cond = function()
	-- 			-- 						return #vim.api.nvim_list_tabpages() > 1
	-- 			-- 					end,
	-- 			-- 					mode = 2,
	-- 			-- 					fmt = function(name, context)
	-- 			-- 						local symbol = context.current and "" or "󰆣"
	-- 			-- 						return symbol .. " " .. name
	-- 			-- 					end,
	-- 			-- 				},
	-- 			-- 			},
	-- 			-- 			lualine_b = {},
	-- 			-- 			lualine_c = {},
	-- 			-- 			lualine_x = {},
	-- 			-- 			lualine_y = {},
	-- 			-- 			lualine_z = {},
	-- 			-- 		}
	-- 			-- 	else
	-- 			-- 		return {}
	-- 			-- 	end
	-- 			-- end,
	-- 			extensions = {},
	-- 		})
	--
	-- 		-- Keymaps
	-- 		vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { desc = "New Tab" })
	-- 		vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close Tab" })
	-- 	end,
	-- },
}
