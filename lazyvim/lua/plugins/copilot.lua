return {
  "github/copilot.vim",
  config = function()
    vim.keymap.set("i", "<C-e>", "copilot#Dismiss()", { expr = true })
  end,
}
