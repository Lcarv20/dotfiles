return {
    "jinh0/eyeliner.nvim",
    config = function()
        require("eyeliner").setup {
            highlight_on_key = true,
            -- dim = true,
        }
        local colors = require('lcarv.fns').colors().mocha
        vim.api.nvim_set_hl(0, 'EyelinerPrimary', { fg = colors.pink, underline = true })
        vim.api.nvim_set_hl(0, 'EyelinerSecondary', { fg = colors.teal, bold = true, underline = true })
    end,
}
