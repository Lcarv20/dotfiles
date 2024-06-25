return {
  "shellRaining/hlchunk.nvim",
  enable = false,
  event = { "UIEnter" },
  config = function()
    local ft = require "hlchunk.utils.filetype"
    local colors = require "lcarv.colors"

    local hl_color = colors.orange

    require("hlchunk").setup {
      context = {
        use_treesitter = true,
      },
      chunk = {
        enable = true,
        notify = true,
        use_treesitter = true,
        -- details about support_filetypes and exclude_filetypes in https://github.com/shellRaining/hlchunk.nvim/blob/main/lua/hlchunk/utils/filetype.lua
        support_filetypes = ft.support_filetypes,
        exclude_filetypes = vim.tbl_deep_extend("force", ft.exclude_filetypes, { netrw = true, glance = true })
          or ft.exclude_filetypes,
        chars = {
          horizontal_line = "─",
          vertical_line = "│",
          left_top = "╭",
          left_bottom = "╰",
          -- right_arrow = ">",
          -- horizontal_line = "─",
          -- vertical_line = "│",
          -- left_top = "┌",
          -- left_bottom = "└",
          right_arrow = "─",
        },
        style = {
          { fg = hl_color },
          { fg = colors.suave_red }, -- this fg is used to highlight wrong chunk
        },
        textobject = "",
        max_file_size = 1024 * 1024,
        error_sign = true,
      },

      indent = {
        enable = false,
      },

      line_num = {
        enable = true,
        use_treesitter = false,
        style = hl_color,
      },

      blank = {
        enable = false,
      },
    }
  end,
}
