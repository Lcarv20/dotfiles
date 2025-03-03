return {
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = function()
  --     -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
  --     -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })
  --     require("lspconfig.ui.windows").default_options.border = "single"
  --
  --     local keys = require("lazyvim.plugins.lsp.keymaps").get()
  --     keys[#keys + 1] = {
  --       "<c-k>",
  --       vim.lsp.buf.signature_help,
  --       mode = { "i", "n" },
  --       desc = "signature help",
  --       has = "signaturehelp",
  --     }
  --
  --     local signs = {
  --       { name = "diagnosticsignerror", text = " " },
  --       { name = "diagnosticsignwarn", text = " " },
  --       { name = "diagnosticsigninfo", text = " " },
  --       { name = "diagnosticsignhint", text = " " },
  --     }
  --
  --     for _, sign in ipairs(signs) do
  --       vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  --     end
  --
  --     local default_diagnostic_config = {
  --       signs = {
  --         active = signs,
  --       },
  --       virtual_text = {
  --         prefix = "⏺",
  --       },
  --       update_in_insert = false,
  --       underline = true,
  --       severity_sort = true,
  --       float = {
  --         focusable = true,
  --         style = "minimal",
  --         border = "none",
  --         source = "always",
  --         header = "",
  --         prefix = function(diagnostic, i, total)
  --           local function get_i()
  --             if total > 1 then
  --               return " " .. i .. ")"
  --             end
  --             return ""
  --           end
  --
  --           local get_lnum_range = function()
  --             if diagnostic.lnum ~= diagnostic.end_lnum then
  --               return diagnostic.lnum + 1 .. ":" .. diagnostic.end_lnum + 1
  --             end
  --             return diagnostic.lnum + 1
  --           end
  --
  --           local get_col_range = function()
  --             if diagnostic.col ~= diagnostic.end_col then
  --               return diagnostic.col .. ":" .. diagnostic.end_col
  --             end
  --             return diagnostic.col
  --           end
  --
  --           local sign = signs[diagnostic.severity].text
  --           local hl = signs[diagnostic.severity].name
  --
  --           return string.format("%s%s [%s,%s] ", sign, get_i(), get_lnum_range(), get_col_range()), hl
  --         end,
  --       },
  --     }
  --
  --     vim.diagnostic.config(default_diagnostic_config)
  --
  --     for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config() or {}, "signs", "values") or {}) do
  --       vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  --     end
  --   end,
  -- },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        cssls = {
          settings = {
            scss = {
              validate = true,
              lint = {
                unknownAtRules = "ignore",
              },
            },
            less = {
              validate = true,
              lint = {
                unknownAtRules = "ignore",
              },
            },
            css = {
              validate = true,
              lint = {
                unknownAtRules = "ignore",
              },
            },
          },
        },
        sourcekit = {},
      },
    },
  },
}
