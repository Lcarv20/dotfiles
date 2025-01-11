return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
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
			defaults = {
				-- mappings = {
				--   i = { ['<c-enter>'] = 'to_fuzzy_refine' },
				-- },
				border = {},
				borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
				layout_config = { prompt_position = "top"},
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
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search Help" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search Keymaps" })
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Search Files" })
		-- vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = 'Search Select Telescope' })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Search current Word" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Search by Grep" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search Diagnostics" })
		vim.keymap.set("n", "<leader>sr", builtin.oldfiles, { desc = 'Search Recent Files ("." for repeat)' })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find existing buffers" })

		vim.keymap.set("n", "<leader>sF", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })

		vim.keymap.set("n", "<leader>sG", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "Search / in Open Files" })

		-- -- Shortcut for searching your Neovim configuration files
		-- vim.keymap.set('n', '<leader>sn', function()
		--   builtin.find_files { cwd = vim.fn.stdpath 'config' }
		-- end, { desc = 'Search Neovim files' })
	end,
}
