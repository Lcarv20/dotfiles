return {
  {
    "NvChad/nvim-colorizer.lua",
    event = "VeryLazy",
    opts = {
      filetypes = {
        "typescript",
        "typescriptreact",
        "javascript",
        "javascriptreact",
        "css",
        "html",
        "astro",
        "lua",
      },
      user_default_options = {
        names = false,
        rgb_fn = true,
        tailwind = "both",
      },
    },
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    event = "VeryLazy",
    opts = {
      color_square_width = 2,
    },
  },
  {
    event = "VeryLazy",
    "dmmulroy/tsc.nvim",
    opts = {},
  },
  {
    event = "VeryLazy",
    "yioneko/nvim-vtsls",
    -- TODO: Add key maps
  },
}
