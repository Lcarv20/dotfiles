return {
  "saghen/blink.cmp",
  opts = {
    cmdline = {
      keymap = {
        -- recommended, as the default keymap will only show and select the next item
        ["<Tab>"] = { "show", "accept" },
        ["<CR>"] = { "accept_and_enter", "fallback" },
      },
      completion = {
        menu = {
          auto_show = function(_)
            return vim.fn.getcmdtype() == ":"
              -- enable for inputs as well, with:
              or vim.fn.getcmdtype() == "@"
          end,
        },
      },
      -- keymap = {
      --   ["<Tab>"] = { "select_and_accept", "fallback" },
      --   ["<S-Tab>"] = { "select_prev", "fallback" },
      --   ["<C-n>"] = { "select_next", "fallback" },
      --   ["<C-p>"] = { "select_prev", "fallback" },
      --   ["<Cr>"] = { "accept", "fallback" },
      -- },
      sources = function()
        local type = vim.fn.getcmdtype()
        -- Search forward and backward
        if type == "/" or type == "?" then
          return { "buffer" }
        end
        -- Commands
        if type == ":" or type == "@" then
          return { "cmdline" }
        end
        return {}
      end,
    },
    -- sources = {
    --   cmdline = function()
    --     local type = vim.fn.getcmdtype()
    --     -- Search forward and backward
    --     if type == "/" or type == "?" then
    --       return { "buffer" }
    --     end
    --     -- Commands
    --     if type == ":" or type == "@" then
    --       return { "cmdline" }
    --     end
    --     return {}
    --   end,
    -- },
    keymap = {
      preset = "enter",
      ["<Tab>"] = {
        "snippet_forward",
        "fallback",
      },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },
      -- cmdline = {
      --   ["<Tab>"] = { "select_and_accept", "fallback" },
      --   ["<S-Tab>"] = { "select_prev", "fallback" },
      --   ["<C-n>"] = { "select_next", "fallback" },
      --   ["<C-p>"] = { "select_prev", "fallback" },
      --   ["<Cr>"] = { "accept", "fallback" },
      -- },
    },

    completion = {
      menu = {
        auto_show = true,
      },
      list = {
        selection = {
          preselect = false,
          auto_insert = false,
        },
      },
    },
  },
}
