local icons = require("lcarv.icons")
-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = "LSP: " .. desc
    end

    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
  end

  nmap(" lr", vim.lsp.buf.rename, "[r]eame")
  nmap(" la", vim.lsp.buf.code_action, "code [a]ction")
  nmap(" lD", vim.lsp.buf.type_definition, "Type [D]efinition")
  -- nmap(" lS", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
  -- nmap(" lW", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

  nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
  nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")

  nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
  nmap('gl', vim.diagnostic.open_float, "Open floating diagnostic message")
  nmap("gr", "<cmd>TroubleToggle lsp_references<cr>", "[R]eferences")

  nmap('[d', vim.diagnostic.goto_prev, "Go to previous diagnostic message")
  nmap(']d', vim.diagnostic.goto_next, "Go to next diagnostic message")

  nmap("K", vim.lsp.buf.hover, "Hover Documentation")
  -- See sig help insert mode
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
    { remap = false, desc = "Signature Help", buffer = bufnr })

  nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
  vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help", buffer = bufnr })

  -- TROUBLE
  -- nmap(" lt", "<cmd>TroubleToggle<cr>", "TroubleToggle")
  nmap(" lw", "<cmd>TroubleToggle workspace_diagnostics<cr>", "TroubleToggle [w]orkspace diagnostics")
  nmap(" ld", "<cmd>TroubleToggle document_diagnostics<cr>", "TroubleToggle [d]ocument diagnostics")

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
    vim.lsp.buf.format()
  end, { desc = "Format current buffer with LSP" })

  -- -- lsp_signature
  -- require "lsp_signature".on_attach({
  --   bind = true,   -- This is mandatory, otherwise border config won't get registered.
  --   handler_opts = {
  --     border = "rounded"
  --   }
  -- }, bufnr)
end

-- Setup neovim lua configuration
require("neodev").setup()

-- vim.diagnostic.config {
--   float = { border = "single" },
--   virtual_text = {
--     prefix = "⏺"
--   },
--
-- }

vim.diagnostic.config({
  -- virtual_text = true,
  virtual_text = {
    prefix = "⏺"
  },
  signs = {
    active = true,
    values = {
      { name = "DiagnosticSignError", text = icons.diagnostics.Error },
      { name = "DiagnosticSignWarn",  text = icons.diagnostics.Warning },
      { name = "DiagnosticSignHint",  text = icons.diagnostics.Hint },
      { name = "DiagnosticSignInfo",  text = icons.diagnostics.Info },
    }
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "none",
    source = "always",
    header = "",
    prefix = "",
    format = function(d)
      local code = d.code or (d.user_data and d.user_data.lsp.code)
      if code then
        print("settings.lua: " .. vim.inspect(d))
        return string.format("%s [%s]", d.message, code):gsub("1. ", "")
      end
      return d.message
    end,
  },
})


-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require "mason-lspconfig"

local servers = require("lcarv.lsp.servers")

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require("lspconfig")[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}
