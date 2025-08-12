local map = vim.keymap.set
local ignore = { desc = "which_key_ignore" }
local fns = require("utils.fns")

-- General
map("n", "J", "mzJ`z") -- keep cursor in place
map("i", "jj", "<ESC>") -- quit insert mode
map("n", "<leader>h", "<cmd>nohlsearch<CR>", ignore)
map("n", "<esc>", "<cmd>nohlsearch<CR>", ignore)
map({ "i", "x", "n", "s" }, "<D-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
map("n", "<leader>qa", "<cmd>qa<cr>", { desc = "Quit All" })
map("n", "<leader>qq", "<cmd>q<cr>", { desc = "Quit current" })

-- Maintain scroll in the middle
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
-- Middle of the screen when going through searches
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- -- Resize with arrows
map("n", "<M-Up>", ":resize -2<CR>")
map("n", "<M-Down>", ":resize +2<CR>")
-- Map("n", "<M-Left>", ":vertical resize -2<CR>")
-- Map("n", "<M-Right", ":vertical resize +2<CR>")
-- Escape sequence for the commented above keymaps for mac
map("n", "<Esc>b", ":vertical resize -2<CR>", { noremap = true, silent = true })
map("n", "<Esc>f", ":vertical resize +2<CR>", { noremap = true, silent = true })

-- Delete without saving the replaced text to buffer
map("x", "<leader>p", [["_dP]], ignore)
-- Paste to system clipboard
map({ "n", "v" }, "<leader>y", [["+y]], ignore)
map("n", "<leader>Y", [["+y$]], ignore)
map("n", "<leader>yy", [["+Y]], ignore)
-- Delete to void
map({ "n", "v" }, "<leader>d", [["_d]], ignore)
map({ "n", "v" }, "<leader>D", [["_d$]], ignore)

-- Move current line / block with Alt-j/k a la vscode.
map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")

-- Move current line / block with Alt-j/k ala vscode.
map("x", "<A-j>", ":m '>+1<CR>gv-gv")
map("x", "<A-k>", ":m '<-2<CR>gv-gv")

-- Move current line insert mode with option/alt + j/k
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi")

-- Do not lose visual focus on the selection after indend
map("v", "<", "<gv")
map("v", ">", ">gv")

map("n", "<d-j>", function()
	Snacks.terminal()
end, { noremap = true, silent = true, desc = "Toggle terminal" })
map("t", "<d-j>", function()
	Snacks.terminal()
end, { noremap = true, silent = true, desc = "Toggle terminal" })
map("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true, desc = "Switch to normal mode from terminal" })
map("t", "<C-n>", function()
	Snacks.terminal.open()
end, { noremap = true, silent = true, desc = "Open new terminal split" })
-- map("t", "jj", "<C-\\><C-n>", { noremap = true, silent = true })

-- Git
map("n", "<leader>g", "", { desc = "Git" })
map("n", "<leader>gh", "", { desc = "Hunk" })
-- UI

-- Buffer
map("n", "<leader>b", "", { desc = "Buffer" })

-- Snacks
map("n", "<leader>s", "", { desc = "Search" })
map("n", "<leader>f", "", { desc = "Search" })

map("n", "<leader>md", function()
	---@type snacks.Config

	Snacks.input({
		prompt = "Mark to delete: ",
	}, function(mark)
		if mark and mark ~= "" then
			vim.cmd("delmarks " .. mark)
		end
	end)
end, { desc = "Delete Mark" })
map("n", "<leader>mD", "<cmd>delmarks A-Z a-z<cr>", { desc = "Delete all marks" })

vim.keymap.set("n", "<C-i>", "<C-i>", { noremap = true })
