local colors = require('lcarv.colors')

vim.api.nvim_set_hl(0, "EyelinerPrimary", { fg = colors.pink_shock, underline = true })
vim.api.nvim_set_hl(0, "EyelinerSecondary", { fg = colors.cyan, bold = true, underline = true })

