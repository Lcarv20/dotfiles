local keymaps = require "lcarv.lsp.keymaps"
require("lcarv.lsp.settings").style()

local on_attach = function(_, bufnr)
  keymaps.define(bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local mason_lspconfig = require "mason-lspconfig"
local servers = require "lcarv.lsp.servers"

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    if server_name == "lua_ls" then
      require("neodev").setup {}
    end

    if server_name == "vtsls" then
      require("lspconfig.configs").vtsls = require("vtsls").lspconfig
    end

    require("lspconfig")[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}
