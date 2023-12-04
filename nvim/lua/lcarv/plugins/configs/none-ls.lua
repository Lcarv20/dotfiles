return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        local formatting = null_ls.builtins.formatting

        null_ls.setup {
            sources = {
                formatting.stylua,
                formatting.prettier,
                formatting.prettier.with {
                    extra_filetypes = { "toml" },
                    -- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
                },
                -- null_ls.builtins.diagnostics.eslint,
                null_ls.builtins.completion.spell,
            },
        }
    end
}
