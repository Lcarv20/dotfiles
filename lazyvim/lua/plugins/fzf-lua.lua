return {
  "ibhagwan/fzf-lua",
  keys = {
    { "<leader>,", false },
    { "<leader>/", false },
    { "<leader>:", false },
    { "<leader><space>", false },
  },
  opts = {
    winopts = {
      border = "none",
    },
    fzf_args = '--prompt="   "',
  },
}
