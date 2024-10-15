return {
  "neovim/nvim-lspconfig",
  opts = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()

    keys[#keys + 1] = {
      "<c-k>",
      vim.lsp.buf.signature_help,
      mode = { "i", "n" },
      desc = "Signature Help",
      has = "signatureHelp",
    }
  end,
}
