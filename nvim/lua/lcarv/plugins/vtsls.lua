return {
  event = "VeryLazy",
  -- enabled = false,
  "yioneko/nvim-vtsls",
  config = function()
    vim.api.nvim_create_autocmd({ "FileType" }, {
      pattern = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "help",
        "man",
        "lspinfo",
        "spectre_panel",
        "lir",
        "DressingSelect",
        "tsplayground",
        "",
      },
      callback = function()
        require("lcarv.fns"):typescript_keymaps()
      end,
    })
  end,
}
