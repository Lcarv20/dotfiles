local fns = require("lcarv.fns")

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  callback = function()
    if vim.bo.ft == "netrw" then
      vim.cmd("echo 'hello'")
    end
  end
})

-- Help at the bottom
vim.cmd([[autocmd BufWinEnter,FileType help wincmd J]])

-- close with q for certain FileType
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "help",
    "man",
    "lspinfo",
    "qf",
    "spectre_panel",
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
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*',
  callback = function()
    if vim.bo.ft == 'neo-tree' then
      vim.cmd('setlocal number')
      vim.cmd('setlocal relativenumber')
    end
  end
})

vim.api.nvim_create_autocmd('BufLeave', {
  pattern = '*',
  callback = function()
    if vim.bo.ft == 'neo-tree' then
      vim.cmd('NeoTreeClose')
    end
  end
})

-- Only uncoment when version 0.10 of neovim
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = { '*.lua', '*.ts', '*.js', '*.go', '*.tsx', '*.jsx' },
  callback = function()
    local isInlayActive = fns.getConfig()

    if isInlayActive["inlayHints"] ~= nil then
      -- checks if inlay hints are supported by the client
      if vim.lsp.inlay_hint then
        vim.lsp.inlay_hint(0, isInlayActive["inlayHints"])
      end
    end
  end,
})

-- Cursor style
-- vim.api.nvim_create_autocmd("VimEnter", {
--   pattern = "*",
--   callback = fns.cursorStyle,
-- })

-- Telescope conditional look for catppuccin
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    local colors_name = vim.trim(vim.g.colors_name)
    if colors_name == "catppuccin-mocha" then
      print("inner")
      require('telescope').setup {
        defaults = {
          borderchars = {
            prompt = { ' ', ' ', '⎯', ' ', ' ', ' ', ' ', ' ' },
            results = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
            preview = { ' ', ' ', ' ', '▏', '▏', ' ', ' ', '▏' },
          },
        }
      }
    end
  end
})

-- Inlay Hints: plugin delete this and remove plugin when on verion 0.10 of neovim
-- vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = "LspAttach_inlayhints",
--   callback = function(args)
--     if not (args.data and args.data.client_id) then
--       return
--     end
--
--     local bufnr = args.buf
--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--     require("lsp-inlayhints").on_attach(client, bufnr)
--   end,
-- })
