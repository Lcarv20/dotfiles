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
      border = "rounded",
      hl = {
        border = "FloatBorder", -- Main window border highlight group
        preview_border = "FloatBorder", -- Separate highlight for preview border
      },
      preview = {
        border = "rounded", -- Preview window border style
      },
    },
    fzf_colors = {
      true, -- inherit fzf colors that aren't specified below from
      -- the auto-generated theme similar to `fzf_colors=true`
      ["fg"] = { "fg", "CursorLine" },
      ["bg"] = { "bg", "Normal" },
      ["hl"] = { "fg", "Comment" },
      ["fg+"] = { "fg", "Normal" },
      ["bg+"] = { "bg", "CursorLine" },
      ["hl+"] = { "fg", "Statement" },
      ["info"] = { "fg", "PreProc" },
      ["prompt"] = { "fg", "Conditional" },
      ["pointer"] = { "fg", "Exception" },
      ["marker"] = { "fg", "Keyword" },
      ["spinner"] = { "fg", "Label" },
      ["header"] = { "fg", "Comment" },
      ["gutter"] = "-1",
    },
    fzf_args = '--prompt="   "',
  },
}
