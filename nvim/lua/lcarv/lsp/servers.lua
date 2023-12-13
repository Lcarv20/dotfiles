local servers = {
  astro = {},

  bashls = {},

  jsonls = {},

  yamlls = {},

  marksman = {},

  tailwindcss = {
    settings = {
      tailwindCSS = {
        classAttributes = { "class", "className", "class:list", "classList", "ngClass", ".*Styles", ".*Classes" },
        -- experimental = {
        --   classRegex = {
        --     "tw`([^`]*)",
        --     "className\\s*:\\s*['\"`]([^'\"`]*)['\"`]",
        --     "Classes \\=([^;]*);",
        --     "'([^']*)'",
        --     "Classes \\=([^;]*);",
        --     '"([^"]*)"',
        --     "Classes \\=([^;]*);",
        --     "\\`([^\\`]*)\\`",
        --   },
        -- },
        lint = {
          cssConflict = "warning",
          invalidApply = "error",
          invalidConfigPath = "error",
          invalidScreen = "error",
          invalidTailwindDirective = "error",
          invalidVariant = "error",
          recommendedVariantOrder = "warning",
        },
        validate = true,
      },
    },
  },

  cssls = {
    css = {
      validate = true,
      lint = {
        unknownAtRules = "ignore",
      },
    },
  },

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

  html = {
    filetypes = {
      "html",
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },
  },

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

  lua_ls = {
    Lua = {
      format = {
        enable = false,
      },
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
      telemetry = { enable = false },
      hint = {
        enable = true,
      },
    },
  },
}

return servers
