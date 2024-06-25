local wk = require "which-key"
local fns = require "lcarv.fns"

local function map(mode, mapping, cmd, opts)
  opts = opts or {}
  opts.silent = true
  vim.keymap.set(mode, mapping, cmd, opts)
end

local ignore = { desc = "which_key_ignore" }

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
map({ "n", "v" }, " ", "<Nop>", { silent = true })
map({ "n" }, " e", ":Neotree left toggle<cr>", { desc = "[e]xplore", silent = true })
map({ "n" }, " w", ":w<cr>", { desc = "[w]rite", silent = true })
map("n", " q", ":q<cr>", { desc = "[q]uit" })

-- FIND
wk.register({ f = { name = "Find" } }, { prefix = "<leader>" }) -- which key is merely to register groups as I don't know how to do it in neovim
map("n", " ff", ":Telescope find_files <cr>", { desc = "[f]iles" })
map("n", " fa", ":Telescope find_files hidden=true<cr>", { desc = "[a]ll files" })
map("n", " fb", ":Telescope buffers<cr>", { desc = "[b]uffers" })
map("n", " fc", ":Telescope colorscheme enable_preview=true<cr>", { desc = "[c]olorscheme" })
map("n", " fB", ":Telescope git_branches<cr>", { desc = "[B]ranches" })
map("n", " fF", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
    winblend = 0,
    previewer = false,
  })
end, { desc = "[F]uzzily search in current buffer" })
map("n", " fh", ":Telescope help_tags<cr>", { desc = "[H]elp" })
map("n", " fw", ":Telescope grep_string<cr>", { desc = "[W]ord" })
map("n", " ft", ":Telescope live_grep<cr>", { desc = "[T]ext" })

-- Find and Replace File
map("n", " r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "[r]eplace word" })

-- GIT
wk.register({ g = { name = "Git" } }, { prefix = "<leader>" })
map("n", " fg", ":Telescope git_files<cr>", { desc = "[G]it files" })
map("n", " gN", ":Neogit<cr>", { desc = "[N]eogit" })

-- LSP
wk.register({ l = { name = "Lsp" } }, { prefix = "<leader>" })

-- UndooTree
-- wk.register({ u = { name = "Undotree" } }, { prefix = "<leader>" })
map("n", " u", ":UndotreeToggle<cr>", { desc = "[u]ndotree" })

-- Refactor
wk.register({ R = { name = "Refactor" } }, { prefix = "<leader>" })

-- Editor
wk.register({ E = { name = "Editor" } }, { prefix = "<leader>" })
map("n", " EL", ":Lazy<cr>", { desc = "[L]azy" })
map("n", " Ei", ":LspInfo<cr>", { desc = "[i]nfo" })
map("n", " Em", ":Mason<cr>", { desc = "[m]ason" })
map("n", " Ec", ":TSContextToggle<cr>", { desc = "treesitter [c]ontext" })
map("n", " h", ":nohl<cr>", { desc = "hide [h]ighlight" })
map("n", "<c-h>", ":tabprevious<cr>", { desc = "hide [h]ighlight" })
map("n", "<c-l>", ":tabnext<cr>", { desc = "hide [h]ighlight" })
map("n", "<c-t>", ":tabnew<cr>", { desc = "hide [h]ighlight" })
map(
  "n",
  " Eh",
  ":lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>",
  { desc = "toggle [h]ighlight" }
)

-- Movement
map("n", "J", "mzJ`z")
map("i", "jj", "<ESC>")

-- Maintain scroll in the middle
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
-- Middle of the screen when going through searches
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Resize with arrows
map("n", "<M-Up>", ":resize -2<CR>")
map("n", "<M-Down>", ":resize +2<CR>")
map("n", "<M-Left>", ":vertical resize -2<CR>")
map("n", "<M-Right>", ":vertical resize +2<CR>")

-- Move current line / block with Alt-j/k a la vscode.
map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")

-- Move current line / block with Alt-j/k ala vscode.
map("x", "<A-j>", ":m '>+1<CR>gv-gv")
map("x", "<A-k>", ":m '<-2<CR>gv-gv")

-- Move current line insert mode with option/alt + j/k
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi")

-- Stay indented in visual mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- delete without saving the replaced text to buffer
map("x", "<leader>p", [["_dP]], ignore)

-- paste to system clipboard
map({ "n", "v" }, "<leader>y", [["+y]], ignore)
map("n", "<leader>Y", [["+Y]], ignore)

-- delete to void
map({ "n", "v" }, "<leader>d", [["_d]], ignore)
