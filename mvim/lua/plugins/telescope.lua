return {
	-- enabled = false,
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			"nvim-lua/plenary.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		require("telescope").setup({
			pickers = {
				colorscheme = {
					enable_preview = true,
				},
				find_files = {
					theme = "dropdown",
					-- coppied from lazyvim
					find_command = function()
						if 1 == vim.fn.executable("rg") then
							return { "rg", "--files", "--color", "never", "-g", "!.git" }
						elseif 1 == vim.fn.executable("fd") then
							return { "fd", "--type", "f", "--color", "never", "-E", ".git" }
						elseif 1 == vim.fn.executable("fdfind") then
							return { "fdfind", "--type", "f", "--color", "never", "-E", ".git" }
						elseif 1 == vim.fn.executable("find") and vim.fn.has("win32") == 0 then
							return { "find", ".", "-type", "f" }
						elseif 1 == vim.fn.executable("where") then
							return { "where", "/r", ".", "*" }
						end
					end,
					hidden = true,
				},
				live_grep = {
					theme = "ivy",
				},
				diagnostics = {
					theme = "ivy",
				},
				git_files = {
					theme = "dropdown",
				},
				oldfiles = {
					theme = "dropdown",
					previewer = false,
				},
				buffers = {
					theme = "dropdown",
					previewer = false,
				},
				lsp_definitions = {
					theme = "ivy",
				},
				lsp_references = {
					theme = "ivy",
				},
				lsp_implementations = {
					theme = "ivy",
				},
				lsp_type_definitons = {
					theme = "ivy",
				},
			},
			defaults = {
				mappings = {
					n = {
						["<c-d>"] = require("telescope.actions").delete_buffer,
						["<C-f>"] = require("telescope.actions").preview_scrolling_down,
						["<C-b>"] = require("telescope.actions").preview_scrolling_up,
					},
					i = {
						["<c-enter>"] = "to_fuzzy_refine",
						["<C-h>"] = "which_key",
						["<c-d>"] = require("telescope.actions").delete_buffer,
						["<C-f>"] = require("telescope.actions").preview_scrolling_down,
						["<C-b>"] = require("telescope.actions").preview_scrolling_up,
						["<ESC>"] = require("telescope.actions").close,
					},
				},
				prompt_prefix = " 󰍉 ",
        selection_caret = "󰅂 ",
				border = {},
				borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
				layout_config = { prompt_position = "top" },
				sorting_strategy = "ascending",
			},
			-- pickers = {}
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		-- Enable elescope extensions if they are installed
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		-- See `:help telescope.builtin`
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>f", "", { desc = "Find" })
		vim.keymap.set("n", "<leader>s", "", { desc = "Search" })
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search Help" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search Keymaps" })
		vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Find Git Files" })
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
		-- vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = 'Search Select Telescope' })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Search current Word" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Search by Grep" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search Diagnostics" })
		vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Find Recent Files" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find existing buffers" })
		vim.keymap.set("n", "<leader>uc", builtin.colorscheme, { desc = "Change colorscheme" })

		vim.keymap.set("n", "<leader>sF", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "Fuzzy Find in Current Buffer" })

		vim.keymap.set("n", "<leader>sG", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "Search / in Open Files" })

		-- -- Shortcut for searching your Neovim configuration files
		vim.keymap.set("n", "<leader>fc", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "Find Neovim config" })
	end,
}
