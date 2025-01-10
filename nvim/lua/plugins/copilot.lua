return {
  "github/copilot.vim",
  enabled = false,
  config = function()
    vim.keymap.set("i", "<C-e>", "copilot#Dismiss()", { expr = true })
  end,
}
