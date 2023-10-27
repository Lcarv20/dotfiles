-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  clangd = {},
  gopls = {
    settings = {
      gopls = {
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        },
      },
    },
  },
  marksman = {
    -- cmd = { "marksman", "server" },
    -- filetypes = { "markdown", "markdown.mdx" },
    -- root_dir = require("lspconfig.util").root_pattern("marksman.json", ".git", ".marksman.toml"),
    -- single_file_support = true
  },
  -- html
  html = {
    filetypes = { "html", "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact",
      "typescript.tsx" },
  },
  -- Emmet
  emmet_ls = {
    init_options = {
      filetypes = { "html", "css", "typescriptreact", "javascriptreact", "php", "mdx" },
      html = {
        options = {
          -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
          ["bem.enabled"] = true,
          ["jsx.enabled"] = true,
        },
      },
      autostart = true,
    },
  },
  -- CSS
  cssls = {},
  pyright = {},
  rust_analyzer = {},
  -- tsserver = {
  --   settings = {
  --     typescript = {
  --       inlayHints = {
  --         includeInlayParameterNameHints = 'all',
  --         includeInlayParameterNameHintsWhenArgumentMatchesName = false,
  --         includeInlayFunctionParameterTypeHints = true,
  --         includeInlayVariableTypeHints = true,
  --         includeInlayVariableTypeHintsWhenTypeMatchesName = false,
  --         includeInlayPropertyDeclarationTypeHints = true,
  --         includeInlayFunctionLikeReturnTypeHints = true,
  --         includeInlayEnumMemberValueHints = true,
  --       }
  --     },
  --     javascript = {
  --       inlayHints = {
  --         includeInlayParameterNameHints = 'all',
  --         includeInlayParameterNameHintsWhenArgumentMatchesName = false,
  --         includeInlayFunctionParameterTypeHints = true,
  --         includeInlayVariableTypeHints = true,
  --         includeInlayVariableTypeHintsWhenTypeMatchesName = false,
  --         includeInlayPropertyDeclarationTypeHints = true,
  --         includeInlayFunctionLikeReturnTypeHints = true,
  --         includeInlayEnumMemberValueHints = true,
  --       }
  --     }
  --   }
  -- },
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      hint = {
        enable = true,
      },
    },
  },
}

return servers
