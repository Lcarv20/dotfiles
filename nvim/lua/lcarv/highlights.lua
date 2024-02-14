local colors = require "lcarv.colors"

-- ILLUMINATE
vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "CursorLine" })
vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "CursorLine" })
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "CursorLine" })

-- EYELINER
vim.api.nvim_set_hl(0, "EyelinerPrimary", { fg = colors.pink_shock, underline = true })
vim.api.nvim_set_hl(0, "EyelinerSecondary", { fg = colors.cyan, bold = true, underline = true })

