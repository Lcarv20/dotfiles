local M = {}

M.nmap = function(keys, func, desc)
  if desc then
    desc = "LSP: " .. desc
  end

  vim.keymap.set("n", keys, func, { desc = desc, noremap = true })
end

M.cursor_style = function()
  -- create highlights for the different modes
  local colors = require "lcarv.colors"

  vim.api.nvim_set_hl(0, "NCursor", { bg = colors.blue })
  vim.api.nvim_set_hl(0, "ICursor", { bg = colors.green })
  vim.api.nvim_set_hl(0, "VCursor", { bg = colors.purple })
  vim.api.nvim_set_hl(0, "RCursor", { bg = colors.red })
  vim.api.nvim_set_hl(0, "ComCursor", { bg = colors.yellow })
  vim.api.nvim_set_hl(0, "NoiceCursor", { bg = colors.saphire })

  vim.opt.guicursor =
    "n:block-NCursor,ci:block-NoiceCursor,v:block-VCursor,i-ci-ve:block-ICursor,r-cr-o:block-RCursor,sm:block-ComCursor"
end

M.toggle_inlay_hints = function()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.lsp.inlay_hint.enable(bufnr, not vim.lsp.inlay_hint.is_enabled(bufnr))
end

M.typescript_keymaps = function()
  local status_ok, which_key = pcall(require, "which-key")
  if not status_ok then
    print "not working"
    return
  end

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
      icon = "󰛦",
      hl = "miniiconsblue",
    },
    {
      "<leader>tr",
      "<cmd>vtsexec rename_file<cr>",
      desc = "rename file",
    },
    {
      "<leader>td",
      "<cmd>vtsexec goto_source_definition<cr>",
      desc = "source defenition",
    },
    {
      "<leader>tr",
      "<cmd>vtsexec file_references<cr>",
      desc = "file references",
    },
    {
      "<leader>to",
      "<cmd>vtsexec organize_imports<cr>",
      desc = "organize imports",
    },
    {
      "<leader>ts",
      "<cmd>vtsexec sort_imports<cr>",
      desc = "sort imports",
    },
    {
      "<leader>tu",
      "<cmd>vtsexec remove_unused_imports<cr>",
      desc = "remove unused imports",
    },
    {
      "<leader>tf",
      "<cmd>vtsexec fix_all<cr>",
      desc = "fix all",
    },
    {
      "<leader>tu",
      "<cmd>vtsexec remove_unused<cr>",
      desc = "remove unused",
    },
    {
      "<leader>tm",
      "<cmd>vtsexec add_missing_imports<cr>",
      desc = "add missing imports",
    },
  }

  which_key.add(mappings, opts)
end

return M
