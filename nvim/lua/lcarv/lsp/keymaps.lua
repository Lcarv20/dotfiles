local M = {}

local nmap = function(keys, func, desc, bufnr)
  if desc then
    desc = "LSP: " .. desc
  end

  vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
end

function M.define(bufnr)
  nmap(" lr", vim.lsp.buf.rename, "[r]eame", bufnr)
  nmap(" la", vim.lsp.buf.code_action, "code [a]ction", bufnr)
  nmap(" lD", vim.lsp.buf.type_definition, "Type [D]efinition", bufnr)
  -- nmap(" lS", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
  -- nmap(" lW", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

  nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition", bufnr)
  nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation", bufnr)

  nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration", bufnr)
  nmap("gl", vim.diagnostic.open_float, "Open floating diagnostic message", bufnr)
  nmap("gr", "<cmd>TroubleToggle lsp_references<cr>", "[R]eferences", bufnr)

  nmap("[d", vim.diagnostic.goto_prev, "Go to previous diagnostic message", bufnr)
  nmap("]d", vim.diagnostic.goto_next, "Go to next diagnostic message", bufnr)

  nmap("K", vim.lsp.buf.hover, "Hover Documentation", bufnr)
  -- See sig help insert mode
  vim.keymap.set("i", "<C-h>", function()
    vim.lsp.buf.signature_help()
  end, { remap = false, desc = "Signature Help", buffer = bufnr })

  nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation", bufnr)
  vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help", buffer = bufnr })

  -- TROUBLE
  -- nmap(" lt", "<cmd>TroubleToggle<cr>", "TroubleToggle")
  nmap(" lw", "<cmd>TroubleToggle workspace_diagnostics<cr>", "TroubleToggle [w]orkspace diagnostics", bufnr)
  nmap(" ld", "<cmd>TroubleToggle document_diagnostics<cr>", "TroubleToggle [d]ocument diagnostics", bufnr)
end

return M
