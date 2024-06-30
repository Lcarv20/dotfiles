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
    print("not working")
    return
  end

  local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
  }

  -- local mappings = {
  --     t = {
  --         name = "[T]ools➡(javascript)",
  --         R = { "<cmd>VtsExec rename_file<Cr>", "[R]ename file" },
  --         C = { "<cmd>VtsExec goto_project_config<cr>", "open [c]onfig" },
  --         d = { "<cmd>VtsExec goto_source_definition<Cr>", "source [d]efenition" },
  --         r = { "<cmd>VtsExec file_references<Cr>", "file [r]eferences" },
  --         o = { "<cmd>VtsExec organize_imports<Cr>", "[o]rganize imports" },
  --         s = { "<cmd>VtsExec sort_imports<Cr>", "[s]ort imports" },
  --         U = { "<cmd>VtsExec remove_unused_imports<Cr>", "remove [U]nused imports" },
  --         f = { "<cmd>VtsExec fix_all<Cr>", "[f]ix all" },
  --         u = { "<cmd>VtsExec remove_unused<Cr>", "remove [u]nused" },
  --         m = { "<cmd>VtsExec add_missing_imports<Cr>", "add [m]issing imports" },
  --         a = { "<cmd>VtsExec source_actions<Cr>", "source [a]ctions" },
  --         t = { "<cmd>VtsExec select_ts_version<Cr>", "select [t]s version" },
  --         p = { "<cmd>VtsExec reload_projects<Cr>", "reload [p]rojects" },
  --     },
  -- }

  local mappings = {
    t = {
      name = "[T]ools➡(javascript)",
      R = { "<cmd>TSToolsRenameFile<Cr>", "[R]ename file" },
      d = { "<cmd>TSToolsGoToSourceDefinition<Cr>", "source [d]efenition" },
      r = { "<cmd>TSToolsFileReferences<Cr>", "file [r]eferences" },
      o = { "<cmd>TSToolsOrganizeImports<Cr>", "[o]rganize imports" },
      s = { "<cmd>TSToolsSortImports<Cr>", "[s]ort imports" },
      U = { "<cmd>TSToolsRemoveUnusedImports<Cr>", "remove [U]nused imports" },
      f = { "<cmd>TSToolsFixAll<Cr>", "[f]ix all" },
      u = { "<cmd>TSToolsRemoveUnused<Cr>", "remove [u]nused" },
      m = { "<cmd>TSToolsAddMissingImports<Cr>", "add [m]issing imports" },
    },
  }

  which_key.register(mappings, opts)
end

return M
