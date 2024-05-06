return {
    "ThePrimeagen/refactoring.nvim",
    lazy = true,
    enabled = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    keys = {
        { "<leader>Re", ":Refactor extract ",              desc = "[e]xtract" },
        { "<leader>Re", ":Refactor extract ",              desc = "[e]xtract", mode = "v" },
        { "<leader>Rf", ":Refactor extract_to_file ",      desc = "extract to [f]ile" },
        { "<leader>Rv", ":Refactor extract_var ",          desc = "extract [v]ar" },
        { "<leader>Ri", ":Refactor inline_var",            desc = "[i]nline var" },
        { "<leader>RI", ":Refactor inline_func",           desc = "[I]nline func" },
        { "<leader>Rb", ":Refactor extract_block",         desc = " extract [b]lock" },
        { "<leader>RB", ":Refactor extract_block_to_file", desc = "extract [B]lock to file" },

    },
    config = function()
        require('refactoring').setup({})
    end

}
--
