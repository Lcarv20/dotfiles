return {
  "supermaven-inc/supermaven-nvim",
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<Tab>",
        clear_suggestion = "<C-e>",
        accept_word = "<C-j>",
      },
      ignore_filetypes = {}, -- or { "cpp", }
      color = {
        suggestion_color = "#ffffff",
        cterm = 244,
      },
      log_level = "info", -- set to "off" to disable logging completely
      disable_inline_completion = true, -- disables inline completion for use with cmp
      disable_keymaps = false, -- disables built in keymaps for more manual control
      condition = function()
        -- Define a table of filetypes to check
        local filetypes_to_check = { "neo-tree", "oil", "dashboard", "DressingInput" }

        -- Get the current buffer's filetype
        local current_filetype = vim.bo.filetype

        -- Iterate over the table of filetypes
        for _, filetype in ipairs(filetypes_to_check) do
          if current_filetype == filetype then
            return true
          end
        end
        return false
      end, --
    })
  end,
}
