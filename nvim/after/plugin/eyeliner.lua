local colors = require('lcarv.fns').colors().latte

vim.api.nvim_set_hl(0, 'EyelinerPrimary', { fg = colors.pink, underline = true })
vim.api.nvim_set_hl(0, 'EyelinerSecondary', { fg = colors.sky, bold = true, underline = true })

