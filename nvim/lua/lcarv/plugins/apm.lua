return {
  "ThePrimeagen/vim-apm",
  config = function()
    local apm = require "vim-apm"

    apm:setup {}
    vim.keymap.set("n", "<leader>Ea", function()
      apm:toggle_monitor()
    end, {
      desc = "Toggle apm monitor",
      silent = true,
      noremap = true,
      })
  end,
}
