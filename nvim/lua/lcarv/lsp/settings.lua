local icons = require("lcarv.icons")
local M = {}

M.Border ={
    { " ", "NormalFloat" },
    { " ", "NormalFloat" },
    { " ", "NormalFloat" },
    { " ", "NormalFloat" },
    { " ", "NormalFloat" },
    { " ", "NormalFloat" },
    { " ", "NormalFloat" },
    { " ", "NormalFloat" },
}

-- function that sets the borders for floats
function M.style()

  -- this border is applied to lsp diagnostics and cmp documentation
  local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

  function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or M.Border
    -- opts.border = opts.border or "solid"

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
      focusable = false,
      style = "minimal",
      -- border = "solid",
      border = border,
      source = "always",
      header = "",
      prefix = "",
      format = function(d)
        local code = d.code or (d.user_data and d.user_data.lsp.code)
        if code then
          print("settings.lua: " .. vim.inspect(d))
          return string.format("%s [%s]", d.message, code):gsub("1. ", "")
        end
        return d.message
      end,
    },
  })
end

return M
