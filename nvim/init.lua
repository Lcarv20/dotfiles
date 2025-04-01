require("config.lazy")

if vim.g.vscode then
  print("I am using vscode")
  vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
end

