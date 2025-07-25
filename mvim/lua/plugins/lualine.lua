return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	opts = function(_, opts)
		local M = require("lualine.component"):extend()
		M.processing = false
		M.spinner_index = 1
		local spinner_symbols = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
		local spinner_symbols_len = #spinner_symbols
		function M:init(options)
			M.super.init(self, options)
			local group = vim.api.nvim_create_augroup("CodeCompanionHooks", {})
			vim.api.nvim_create_autocmd({ "User" }, {
				pattern = "CodeCompanionRequest",
				group = group,
				callback = function(request)
					self.processing = (request.data.status == "started")
				end,
			})
		end
		function M:update_status()
			if self.processing then
				self.spinner_index = (self.spinner_index % spinner_symbols_len) + 1
				return spinner_symbols[self.spinner_index]
			else
				return nil
			end
		end

		local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
		local hex = string.format("#%06x", normal.bg)

		local colors = {
			blue = "#80a0ff",
			cyan = "#79dac8",
			black = "#080808",
			white = "#c6c6c6",
			red = "#ff5189",
			violet = "#d183e8",
			grey = "#303030",
		}

		local recording = {
			function()
				return vim.fn.reg_recording()
			end,
			icon = "󰑊",
			color = { fg = colors.black, bg = colors.red, gui = "bold" },
			separator = { left = "", right = "" },
			left_padding = 2,
		}

		local recorded = {
			function()
				return vim.fn.reg_recorded()
			end,
			icon = "󰐊",
			color = { fg = colors.black, bg = colors.cyan, gui = "bold" },
			separator = { left = "", right = "" },
		}

		local bubbles_theme = {
			normal = {
				a = { fg = colors.black, bg = colors.violet },
				b = { fg = colors.white, bg = colors.grey },
				c = { bg = hex },
			},
			insert = { a = { fg = colors.black, bg = colors.blue } },
			visual = { a = { fg = colors.black, bg = colors.cyan } },
			replace = { a = { fg = colors.black, bg = colors.red } },
			inactive = {
				a = { fg = colors.white, bg = colors.grey },
				b = { fg = colors.white, bg = colors.grey },
				c = { fg = colors.white, bg = hex },
			},
		}

		opts.options = {
			theme = bubbles_theme,
			component_separators = " ",
			section_separators = { left = "", right = "" },
		}

		local function is_not_codecompanion_buf()
			return vim.bo.filetype ~= "codecompanion"
		end

		opts.sections = {
			lualine_a = { { "mode", separator = { left = "", right = " " }, right_padding = 2 } },
			lualine_b = {
				{
					"filename",
					cond = is_not_codecompanion_buf,
					separator = { left = "", right = " ", color = { fg = colors.white, bg = colors.grey } },
				},
			},
			lualine_c = {
				{ "branch", cond = is_not_codecompanion_buf },
				"%=",
				recording,
				recorded,
			},
			lualine_x = {
				{
					require("utils.codecompanion_spinner"),
					separator = { right = "" },
					icon = { " ", align = "left" },
					color = { bg = hex },
				},
			},
			lualine_y = {
				{ "filetype", cond = is_not_codecompanion_buf },
				{ "progress", cond = is_not_codecompanion_buf },
			},
			lualine_z = { { "location", separator = { left = "", right = " " } } },
		}
		opts.inactive_sections = {
			lualine_a = { { "filename", separator = { left = "", right = " " }, right_padding = 2 } },
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = { { "location", separator = { left = "", right = " " } } },
		}

		local custom_tab_names = {}

		local tabline_bg = normal.bg or "#000000" -- Fallback background
		vim.api.nvim_set_hl(0, "LualineTabActive", { fg = bubbles_theme.normal.a.fg, bg = bubbles_theme.normal.a.bg })
		vim.api.nvim_set_hl(0, "LualineTabInactive", { fg = bubbles_theme.normal.b.fg, bg = bubbles_theme.normal.b.bg })
		vim.api.nvim_set_hl(0, "LualineTabSepActive", { fg = bubbles_theme.normal.a.bg, bg = tabline_bg })
		vim.api.nvim_set_hl(0, "LualineTabSepInactive", { fg = bubbles_theme.normal.b.bg, bg = tabline_bg })

		local function render_fancy_tabs()
			local parts = {}
			local current_tab = vim.fn.tabpagenr()
			local tab_count = vim.fn.tabpagenr("$")

			for i = 1, tab_count do
				local file_name
				local custom_name = custom_tab_names[i]
				if custom_name and custom_name ~= "" then
					file_name = custom_name
				else
					local buflist = vim.fn.tabpagebuflist(i)
					local winnr = vim.fn.tabpagewinnr(i)
					local fnamemod = vim.fn.fnamemodify(vim.fn.bufname(buflist[winnr]), ":t")
					file_name = fnamemod == "" and "[No Name]" or fnamemod
				end

				local is_current = (i == current_tab)
				local icon = is_current and "" or "󰆣"
				local label = string.format(" %s %s ", icon, file_name)

				local content_hl = is_current and "LualineTabActive" or "LualineTabInactive"
				local sep_hl = is_current and "LualineTabSepActive" or "LualineTabSepInactive"

				table.insert(parts, "%#" .. sep_hl .. "#")
				table.insert(parts, "%#" .. content_hl .. "#" .. label)
				table.insert(parts, "%#" .. sep_hl .. "# ")
			end

			return table.concat(parts)
		end

		local function tabline_z_filename()
			local devicons_ok, devicons = pcall(require, "nvim-web-devicons")
			if not devicons_ok then
				return ""
			end

			local file_name = vim.fn.expand("%:t")
			if file_name == "" then
				return ""
			end

			local ext = vim.fn.expand("%:e")
			local icon, _ = devicons.get_icon(file_name, ext, { default = true })
			return string.format("%s %s", icon, file_name)
		end

		opts.tabline = {
			lualine_a = { render_fancy_tabs },
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {
				{
					tabline_z_filename,
					color = { fg = colors.white, bg = colors.grey },
					separator = { left = "", right = "" },
				},
			},
		}

		opts.extensions = {}

		vim.api.nvim_create_user_command("TabRename", function(_)
			local new_name = opts.fargs[1]
			local current_tab = vim.fn.tabpagenr()

			if new_name and new_name ~= "" then
				custom_tab_names[current_tab] = new_name
			else
				custom_tab_names[current_tab] = nil
			end

			require("lualine").refresh()
		end, {
			nargs = "?",
			desc = "Rename the current lualine tab label",
		})

		vim.keymap.set("n", "<leader>t", "", { desc = "Tabs" })
		vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { desc = "Open new tab" })
		vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close tab" })
	end,
}
