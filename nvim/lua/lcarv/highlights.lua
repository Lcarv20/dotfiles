local colors = require "lcarv.colors"
local hf = vim.api.nvim_set_hl

-- ILLUMINATE
hf(0, "IlluminatedWordText", { link = "CursorLine" })
hf(0, "IlluminatedWordRead", { link = "CursorLine" })
hf(0, "IlluminatedWordWrite", { link = "CursorLine" })

-- EYELINER
-- hf(0, "EyelinerPrimary", { fg = colors.pink_shock, underline = true })
-- hf(0, "EyelinerSecondary", { fg = colors.cyan, bold = true, underline = true })
hf(0, "EyelinerPrimary", { bg = colors.suave_red, fg = "#16161D", bold = true, underline = true })
hf(0, "EyelinerSecondary", { bg = colors.teal, fg = "#16161D", bold = true, underline = true })

-- TODO: add colors
-- cmp highlight
hf(0, "CmpItemMenu", { fg = colors.blue })
hf(0, "CmpItemAbbrMatch", { fg = colors.cyan, bold = true })
hf(0, "CmpItemAbbrMatchFuzzy", { link = "CmpItemAbbrMatch" })
-- hf(0, "CmpItemDefault", {bg = colors.saphire})
hf(0, "PmenuThumb", { bg = colors.blue })
hf(0, "CmpItemKind", { fg = colors.blue })
hf(0, "CmpItemKindSnippet", { fg = colors.mauve })
hf(0, "CmpItemKindKeyword", { fg = colors.red })
hf(0, "CmpItemKindText", { fg = colors.teal })
hf(0, "CmpItemKindMethod", { fg = colors.blue })
hf(0, "CmpItemKindConstructor", { fg = colors.blue })
hf(0, "CmpItemKindFunction", { fg = colors.blue })
hf(0, "CmpItemKindFolder", { fg = colors.blue })
hf(0, "CmpItemKindModule", { fg = colors.blue })
hf(0, "CmpItemKindConstant", { fg = colors.orange })
hf(0, "CmpItemKindField", { fg = colors.green })
hf(0, "CmpItemKindProperty", { fg = colors.green })
hf(0, "CmpItemKindEnum", { fg = colors.green })
hf(0, "CmpItemKindUnit", { fg = colors.green })
hf(0, "CmpItemKindClass", { fg = colors.yellow })
hf(0, "CmpItemKindVariable", { fg = colors.suave_red })
hf(0, "CmpItemKindFile", { fg = colors.blue })
hf(0, "CmpItemKindInterface", { fg = colors.yellow })
hf(0, "CmpItemKindColor", { fg = colors.red })
hf(0, "CmpItemKindReference", { fg = colors.red })
hf(0, "CmpItemKindEnumMember", { fg = colors.red })
hf(0, "CmpItemKindStruct", { fg = colors.blue })
hf(0, "CmpItemKindValue", { fg = colors.orange })
hf(0, "CmpItemKindEvent", { fg = colors.blue })
hf(0, "CmpItemKindOperator", { fg = colors.blue })
hf(0, "CmpItemKindTypeParameter", { fg = colors.blue })
hf(0, "CmpItemKindCopilot", { fg = colors.teal })
