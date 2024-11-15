local map = LazyVim.safe_keymap_set
local ignore = { desc = "which_key_ignore" }

-- General
map("n", "J", "mzJ`z") -- keep cursor in place
map("i", "jj", "<ESC>") -- quit insert mode
map("n", "<leader>h", ":nohlsearch<CR>", ignore)
map({ "i", "x", "n", "s" }, "<D-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Maintain scroll in the middle
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
-- Middle of the screen when going through searches
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Resize with arrows
map("n", "<M-Up>", ":resize -2<CR>")
map("n", "<M-Down>", ":resize +2<CR>")
-- map("n", "<M-Left>", ":vertical resize -2<CR>")
-- map("n", "<M-Right", ":vertical resize +2<CR>")
-- Escape sequence for the commented above keymaps for mac
map("n", "<Esc>b", ":vertical resize -2<CR>", { noremap = true, silent = true })
map("n", "<Esc>f", ":vertical resize +2<CR>", { noremap = true, silent = true })

-- delete without saving the replaced text to buffer
map("x", "<leader>p", [["_dP]], ignore)
-- paste to system clipboard
map({ "n", "v" }, "<leader>y", [["+y]], ignore)
map("n", "<leader>Y", [["+y$]], ignore)
map("n", "<leader>yy", [["+Y]], ignore)
-- delete to void
map({ "n", "v" }, "<leader>d", [["_d]], ignore)
map({ "n", "v" }, "<leader>D", [["_d$]], ignore)

-- diagnostics
map("n", "gl", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

--- DELETING DEFAULT LAZYVIM KEYMAPS
vim.keymap.del("n", "<leader>l")
vim.keymap.del("n", "<leader>`")
-- vim.keymap.del("n", "<leader>-")
-- vim.keymap.del("n", "<leader>|")
vim.keymap.del("n", "<leader>K")
-- these keymaps are for resizing windows but incompatible with mac
vim.keymap.del("n", "<c-up>")
vim.keymap.del("n", "<c-down>")
vim.keymap.del("n", "<c-left>")
vim.keymap.del("n", "<c-right>")
vim.keymap.del("n", "<leader>cd")
