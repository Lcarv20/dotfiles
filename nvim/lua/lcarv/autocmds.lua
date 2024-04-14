local colors = require "lcarv.colors"
local fns = require "lcarv.fns"

local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- -- Help at the bottom
vim.cmd [[autocmd BufWinEnter,FileType help wincmd J]]

-- close with q for certain FileType
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "netrw",
    "Jaq",
    "qf",
    "git",
    "help",
    "man",
    "lspinfo",
    "spectre_panel",
    "lir",
    "DressingSelect",
    "tsplayground",
    "",
  },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      nnoremap <silent> <buffer> <esc> :close<CR>
      set nobuflisted
    ]]
  end,
})

-- Neotree
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "neo-tree",
--   callback = function()
--     vim.cmd "set relativenumber"
--     -- if vim.bo.ft == "neo-tree" then
--     -- end
--   end,
-- })

-- vim.api.nvim_create_autocmd("BufLeave", {
--   pattern = "*",
--   callback = function()
--     if vim.bo.ft == "neo-tree" then
--       vim.cmd "NeoTreeClose"
--     end
--   end,
-- })

-- Cursor style
vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
  pattern = "*",
  callback = fns.cursor_style,
})

-- -- Disable auto comment
-- vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
--   callback = function()
--     vim.cmd "set formatoptions-=cro"
--   end,
-- })

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown", "NeogitCommitMessage" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "EyelinerPrimary", { fg = colors.pink_shock, underline = true })
    vim.api.nvim_set_hl(0, "EyelinerSecondary", { fg = colors.cyan, bold = true, underline = true })
  end,
})

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
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

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "help",
    "man",
    "lspinfo",
    "spectre_panel",
    "lir",
    "DressingSelect",
    "tsplayground",
    "",
  },
  callback = function()
    local mappings = {
      t = {
        name = "Tools➡(javascript)",
        R = { "<cmd>VtsExec rename_file<Cr>", "[R]ename file" },
        C = { "<cmd>VtsExec goto_project_config<cr>", "open [c]onfig" },
        d = { "<cmd>VtsExec goto_source_definition<Cr>", "source [d]efenition" },
        r = { "<cmd>VtsExec file_references<Cr>", "file [r]eferences" },
        o = { "<cmd>VtsExec organize_imports<Cr>", "[o]rganize imports" },
        s = { "<cmd>VtsExec sort_imports<Cr>", "[s]ort imports" },
        U = { "<cmd>VtsExec remove_unused_imports<Cr>", "remove [U]nused imports" },
        f = { "<cmd>VtsExec fix_all<Cr>", "[f]ix all" },
        u = { "<cmd>VtsExec remove_unused<Cr>", "remove [u]nused" },
        m = { "<cmd>VtsExec add_missing_imports<Cr>", "add [m]issing imports" },
        a = { "<cmd>VtsExec source_actions<Cr>", "source [a]ctions" },
        t = { "<cmd>VtsExec select_ts_version<Cr>", "select [t]s version" },
        p = { "<cmd>VtsExec reload_projects<Cr>", "reload [p]rojects" },
      },
    }

    which_key.register(mappings, opts)
  end,
})

-- autocmd to set wrap and spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit", "markdown", "NeogitCommitMessage" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

