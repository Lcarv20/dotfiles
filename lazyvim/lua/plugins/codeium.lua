return {
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    enabled = false,
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set("i", "<c-a>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<c-;>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<c-,>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<c-e>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true, silent = true })
      vim.cmd([[CodeiumDisable]])

      LazyVim.safe_keymap_set({ "n", "x" }, "<leader>uA", "<cmd>CodeiumToggle<cr>", { desc = "Toggle Codeium" })
    end,
  },
  {
    "Exafunction/codeium.nvim",
    enabled = false,
    opts = function()
      vim.g.codeium_filetypes = {
        ["DressingInput"] = false,
        ["neo-tree"] = false,
        ["oil"] = false,
      }
    end,
  },
}
