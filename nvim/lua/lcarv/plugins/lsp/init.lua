local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "folke/neodev.nvim",
    },
    {
      "j-hui/fidget.nvim",
      tag = "legacy",
      opts = {},
    },
    {
      "williamboman/mason-lspconfig.nvim",
      dependencies = {
        { "williamboman/mason.nvim", opts = { ui = { border = "double" } } },
        "nvim-lua/plenary.nvim",
      },
    },
  },
}

M.on_attach = function(client, bufnr)
  local keymaps = require "lcarv.plugins.lsp.keymaps"
  keymaps.define(bufnr)

  if client.supports_method "textDocument/inlayHint" then
    vim.lsp.inlay_hint.enable(bufnr, true)
    vim.api.nvim_set_keymap(
      "n",
      " Eh",
      "<cmd>lua require('lcarv.fns').toggle_inlay_hints()<cr>",
      { noremap = true, silent = true, desc = "Toggle inlay-[h]ints" }
    )
  end
end

function M.common_capabilities()
  local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if status_ok then
    return cmp_nvim_lsp.default_capabilities()
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }

  return capabilities
end

function M.config()
  local lspconfig = require "lspconfig"
  local icons = require "lcarv.icons"

  local servers = {
    "lua_ls",
    "cssls",
    "html",
    "astro",
    "bashls",
    "jsonls",
    "yamlls",
    "marksman",
    "vtsls", -- this might be better than tsserver
    -- "tsserver",
    "emmet_language_server",
    "tailwindcss",
  }

  require("mason-lspconfig").setup {
    ensure_installed = servers,
  }

  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
    { name = "DiagnosticSignHint", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  end

  local default_diagnostic_config = {
    signs = {
      active = signs,
      -- values = {
      --   { name = "DiagnosticSignError", text = icons.diagnostics.Error },
      --   { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
      --   { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
      --   { name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
      -- },
    },
    virtual_text = {
      prefix = "⏺",
    },
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "single",
      source = "always",
      header = "",
      prefix = function(diagnostic, i, total)
        local function get_i()
          if total > 1 then
            return " " .. i .. ")"
          end
          return ""
        end

        local get_lnum_range = function()
          if diagnostic.lnum ~= diagnostic.end_lnum then
            return diagnostic.lnum + 1 .. ":" .. diagnostic.end_lnum + 1
          end
          return diagnostic.lnum + 1
        end

        local get_col_range = function()
          if diagnostic.col ~= diagnostic.end_col then
            return diagnostic.col .. ":" .. diagnostic.end_col
          end
          return diagnostic.col
        end

        local sign = signs[diagnostic.severity].text
        local hl = signs[diagnostic.severity].name

        return string.format("%s%s [%s,%s] ", sign, get_i(), get_lnum_range(), get_col_range()), hl
      end,
    },
  }

  vim.diagnostic.config(default_diagnostic_config)

  for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  end

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })
  require("lspconfig.ui.windows").default_options.border = "single"

  for _, server in pairs(servers) do
    local opts = {
      on_attach = M.on_attach,
      capabilities = M.common_capabilities(),
    }

    local require_ok, settings = pcall(require, "lcarv.plugins.lsp.settings." .. server)
    if require_ok then
      opts = vim.tbl_deep_extend("force", settings, opts)
    end

    if server == "lua_ls" then
      require("neodev").setup {}
    end

    if server == "vtsls" then
      require("lspconfig.configs").vtsls = require("vtsls").lspconfig
    end

    if server == "emmet_language_server" then
      opts.filetypes =
        { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact" }
    end

    lspconfig[server].setup(opts)
  end
end

return M
