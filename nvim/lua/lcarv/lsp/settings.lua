local icons = require("lcarv.icons")
local M = {}

M.Border = {
  { " ", "NormalFloat" },
  { " ", "NormalFloat" },
  { " ", "NormalFloat" },
  { " ", "NormalFloat" },
  { " ", "NormalFloat" },
  { " ", "NormalFloat" },
  { " ", "NormalFloat" },
  { " ", "NormalFloat" },
}

M.Hover = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = M.border }),
}

-- function that sets the borders for floats
function M.style()
  -- this border is applied to lsp diagnostics and cmp documentation
  local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

  function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or M.Border

    return orig_util_open_floating_preview(contents, syntax, opts, ...)
  end

  vim.diagnostic.config({
    -- virtual_text = true,
    virtual_text = {
      prefix = "⏺"
    },
    signs = {
      active = true,
      values = {
        { name = "DiagnosticSignError", text = icons.diagnostics.Error },
        { name = "DiagnosticSignWarn",  text = icons.diagnostics.Warning },
        { name = "DiagnosticSignHint",  text = icons.diagnostics.Hint },
        { name = "DiagnosticSignInfo",  text = icons.diagnostics.Info },
      }
    },
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      -- border = "solid",
      border = M.Border,
      source = "always",
      header = "",
      prefix = "",
      format = function(d)
        local code = d.code or (d.user_data and d.user_data.lsp.code)
        if code then
          return string.format("%s [%s]", d.message, code):gsub("1. ", "")
        end
        return d.message
      end,
    },
  })
end

return M
