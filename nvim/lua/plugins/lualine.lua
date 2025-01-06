return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    local M = require("lualine.component"):extend()

    M.processing = false
    M.spinner_index = 1

    -- local spinner_symbols = { "▙ ", "▛ ", "▜ ", "▟ " }
    local spinner_symbols = {
      "⠋",
      "⠙",
      "⠹",
      "⠸",
      "⠼",
      "⠴",
      "⠦",
      "⠧",
      "⠇",
      "⠏",
    }
    local spinner_symbols_len = 10

    -- Initializer
    function M:init(options)
      M.super.init(self, options)

      local group = vim.api.nvim_create_augroup("CodeCompanionHooks", {})

      vim.api.nvim_create_autocmd({ "User" }, {
        pattern = "CodeCompanionRequest",
        group = group,
        callback = function(request)
          self.processing = (request.data.status == "started")
        end,
      })
    end

    -- Function that runs every time statusline is updated
    function M:update_status()
      if self.processing then
        self.spinner_index = (self.spinner_index % spinner_symbols_len) + 1
        return spinner_symbols[self.spinner_index]
      else
        return nil
      end
    end

    local theme = require("lualine.themes.tokyonight-night")
    theme.normal.c.bg = "none"
    -- theme.insert.c.bg = "none"
    -- theme.visual.c.bg = "none"
    -- theme.replace.c.bg = "none"
    -- theme.command.c.bg = "none"

    local recording = {
      function()
        return vim.fn.reg_recording()
      end,
      icon = "󰑊",
      separator = { left = "", right = "" },
      color = { fg = theme.normal.a.fg, bg = theme.visual.a.bg, gui = "bold" },
      left_padding = 2,
    }

    local recorded = {
      function()
        return vim.fn.reg_recorded()
      end,
      icon = "󰐊",
      separator = { left = " ", right = "" },
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
        {
          require("utils.codecompanion_spinner"),
          separator = { right = "" },
          icon = { " ", align = "left" },
        },
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
