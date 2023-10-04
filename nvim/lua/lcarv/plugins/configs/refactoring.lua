return {
    "ThePrimeagen/refactoring.nvim",
    lazy = false,

    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    keys = {
        { "<leader>ke", ":Refactor extract ",              desc = "[e]xtract" },
        { "<leader>ke", ":Refactor extract ",              desc = "[e]xtract", mode = "v" },
        { "<leader>kf", ":Refactor extract_to_file ",      desc = "extract to [f]ile" },
        { "<leader>kv", ":Refactor extract_var ",          desc = "extract [v]ar" },
        { "<leader>ki", ":Refactor inline_var",            desc = "[i]nline var" },
        { "<leader>kI", ":Refactor inline_func",           desc = "[I]nline func" },
        { "<leader>kb", ":Refactor extract_block",         desc = " extract [b]lock" },
        { "<leader>kB", ":Refactor extract_block_to_file", desc = "extract [B]lock to file" },

    },
    config = function()
        require('refactoring').setup({})
    end

}

