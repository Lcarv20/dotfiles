return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    local theme = require("lualine.themes.auto")
    theme.normal.c.bg = "none"
    theme.insert.c.bg = "none"
    theme.visual.c.bg = "none"
    theme.replace.c.bg = "none"
    theme.command.c.bg = "none"

    local recording = {
      function()
        return vim.fn.reg_recording()
      end,
      icon = "󰑊",
      separator = { left = "", right = "" },
      color = { fg = theme.normal.a.fg, bg = theme.visual.a.bg, gui = "bold" },
      left_padding = 2
    }

    local recorded = {
      function()
        return vim.fn.reg_recorded()
      end,
      icon = "󰐊",
      separator = { left = "", right = "" },
      color = { fg = theme.normal.a.fg, bg = theme.normal.a.bg, gui = "bold" },
    }

    opts.options = {
      theme = theme,
      component_separators = "┃",
      section_separators = { left = "", right = "" },
    }

    opts.sections = {
      lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
      lualine_b = { "filename", "branch" },
      lualine_c = {
        "%=", --[[ add your center components here ]]
        recording,
        recorded,
      },
      lualine_x = {
        {
          "diff",
          -- Is it me or the symbol for modified us really weird
          symbols = { added = " ", modified = " ", removed = " " },
        },
        "diagnostics",
      },
      lualine_y = { "filetype", "progress" },
      lualine_z = {
        { "location", separator = { right = "" }, left_padding = 2 },
      },
    }

    opts.inactive_sections = {
      lualine_a = { "filename" },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { "location" },
    }

    opts.tabline = {}
    opts.extensions = {}
  end,
}
