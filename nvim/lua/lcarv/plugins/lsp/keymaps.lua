local M = {}
local keymap = vim.api.nvim_buf_set_keymap
local opts = function(desc)
  return { noremap = true, silent = true, desc = desc }
end

function M.define(bufnr)
  keymap(bufnr, "n", " lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts "[r]eame")
  keymap(bufnr, "n", " la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts "code [a]ction")
  -- keymap(bufnr, "n", " lD", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts "Type [D]efinition")
  keymap(bufnr, "n", "gY", "<cmd>Glance type_definitions<CR>", opts "Type [D]efinition")
  -- keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts "[G]oto [D]efinition")
  keymap(bufnr, "n", "gd", "<cmd>Glance definitions<CR>", opts "[G]oto [d]efinition")
  -- keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts "[G]oto [I]mplementation")
  keymap(bufnr, "n", "gI", "<cmd>Glance implementations<CR>", opts "[G]oto [I]mplementation")
  keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts "[G]oto [D]eclaration")
  keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts "Open floating diagnostic message")
  -- keymap(bufnr, "n", "gr", "<cmd>TroubleToggle lsp_references<cr>", opts "[R]eferences")
  keymap(bufnr, "n", "gr", "<cmd>Glance references<CR>", opts "[R]eferences")
  keymap(bufnr, "n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts "Go to previous diagnostic message")
  keymap(bufnr, "n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts "Go to next diagnostic message")
  -- keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts "Hover Documentation")
  keymap(
    bufnr,
    "n",
    " lS",
    "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>",
    opts "[D]ocument [S]ymbols"
  )
  keymap(
    bufnr,
    "n",
    " lW",
    "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols(<cr>",
    opts "[W]orkspace [S]ymbols"
  )
  -- See sig help insert mode

  keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts "Signature Documentation")
  keymap(bufnr, "i", "<C-K>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts "Signature Documentation")

  -- TROUBLE
  -- keymap(" lt", "<cmd>TroubleToggle<cr>", "TroubleToggle")
  keymap(
    bufnr,
    "n",
    " lw",
    "<cmd>TroubleToggle workspace_diagnostics<cr>",
    opts "TroubleToggle [w]orkspace diagnostics"
  )
  keymap(bufnr, "n", " ld", "<cmd>TroubleToggle document_diagnostics<cr>", opts "TroubleToggle [d]ocument diagnostics")

  -- Format
  keymap(bufnr, "n", " lf", ":lua vim.lsp.buf.format({timeout_ms = 1000000})<cr>", opts "[f]ormat")
end

return M
