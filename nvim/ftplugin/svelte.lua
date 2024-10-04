local which_key = require "which-key"

local opts = {
  mode = "n", -- normal mode
  prefix = "<leader>",
  buffer = nil, -- global mappings. specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  "<leader>t",
  group = "tools",
  icon = {
    icon = "",
    hl = "miniiconsblue",
  },
  {
    "<leader>to",
    function()
      vim.lsp.buf.code_action {
        apply = true,
        context = {
          only = { "source.organizeImports" },
          diagnostics = {},
        },
      }
    end,
    desc = "organize imports",
  },
  {
    "<leader>ta",
    function()
      vim.lsp.buf.code_action {
        apply = true,
        context = {
          only = { "source.fixAll" },
          diagnostics = {},
        },
      }
    end,
    desc = "fix all",
  },
}

which_key.add(mappings, opts)
