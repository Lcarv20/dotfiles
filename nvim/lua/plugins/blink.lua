return {
  "saghen/blink.cmp",
  opts = {
    sources = {
      cmdline = function()
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
    keymap = {
      preset = "enter",
      ["<Tab>"] = { "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },
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
