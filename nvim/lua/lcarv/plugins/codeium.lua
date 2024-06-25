-- Remove the `use` here if you're using folke/lazy.nvim.
--
return {
  {
    enabled = false,
    "Exafunction/codeium.nvim",
    event = "InsertEnter",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup {}
      vim.g.codeium_filetypes = {
        ["DressingInput"] = false,
        ["neo-tree"] = true,
      }
    end,
  },
  {
    "Exafunction/codeium.vim",
    enabled = false,
    event = "BufEnter",
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set("i", "<c-\\>", function()
        return vim.fn["codeium#Complete"]()
      end, { expr = true })
      vim.keymap.set("i", "<c-a>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true })
      vim.keymap.set("i", "<c-.>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true })
      vim.keymap.set("i", "<c-,>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true })
      vim.keymap.set("i", "<c-x>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true })
      vim.cmd[[CodeiumDisable]]
    end,
  },
}
