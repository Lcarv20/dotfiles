local nmap = require("lcarv.fns").nmap
return {
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      filetypes = {
        "typescript",
        "typescriptreact",
        "javascript",
        "javascriptreact",
        "css",
        "html",
        "astro",
        "lua",
      },
      user_default_options = {
        names = false,
        rgb_fn = true,
        tailwind = "both",
      },
      buftypes = {
        -- '*', -- seems like this doesn't work with the float window, but works with the other `buftype`s.
        -- Not sure if the window has a `buftype` at all
      },
    }
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    opts = {
      color_square_width = 2,
    }
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      on_attach = function()
        local wk = require("which-key")
        wk.register({ T = { name = "Tools" } }, { prefix = "<leader>" })

        nmap(" To", ":TSToolsOrganizeImports<cr>", "[o]rganize imports")
        nmap(" Ts", ":TSToolsSortImports<cr>", "[s]ort imports")
        nmap(" TR", ":TSToolsRemoveUnusedImports<cr>", "[R]emove unused imports")
        nmap(" Tr", ":TSToolsRemoveUnused<cr>", "[r]emove unused")
        nmap(" Ti", ":TSToolsAddMissingImports<cr>", "[i]mport missing")
        nmap(" Tf", ":TSToolsFixAll<cr>", "[f]ix all")
        nmap(" Tg", ":TSToolsGoToSourceDefinition<cr>", "[g]o to source")
      end,

      settings = {
        default_preferences = {
          includeInlayParameterNameHints = 'all',
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = false,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
        filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact",
          "typescript.tsx", "markdown.mdx" },

        -- spawn additional tsserver instance to calculate diagnostics on it
        separate_diagnostic_server = true,
        -- "change"|"insert_leave" determine when the client asks the server about diagnostic
        publish_diagnostic_on = "insert_leave",
        -- array of strings("fix_all"|"add_missing_imports"|"remove_unused"|
        -- "remove_unused_imports"|"organize_imports") -- or string "all"
        -- to include all supported code actions
        -- specify commands exposed as code_actions
        expose_as_code_action = {},
        -- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
        -- not exists then standard path resolution strategy is applied
        tsserver_path = nil,
        -- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
        -- (see 💅 `styled-components` support section)
        tsserver_plugins = {},
        -- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
        -- memory limit in megabytes or "auto"(basically no limit)
        tsserver_max_memory = "auto",
        -- described below
        tsserver_format_options = {},
        tsserver_file_preferences = {},
        -- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
        complete_function_calls = false,
        include_completions_with_insert_text = true,
      },
    },
  }
}
