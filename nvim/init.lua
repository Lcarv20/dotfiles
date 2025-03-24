require("config.lazy")

if vim.g.vscode then
  vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
end

