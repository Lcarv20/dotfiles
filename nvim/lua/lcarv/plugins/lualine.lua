local recording = {
  function()
    return vim.fn.reg_recording()
  end,
  icon = "󰑊",
}

local recorded = {
  function()
    return vim.fn.reg_recorded()
  end,
  icon = "󰐊",
}

local theme = function()
  local colors = {
    darkgray = "#16161d",
    gray = "#C5C6C7",
    innerbg = nil,
    outerbg = "#16161D",
    normal = "#7e9cd8",
    insert = "#98bb6c",
    visual = "#AF8FE9",
    replace = "#e46876",
    command = "#e6c384",
  }
  return {
    inactive = {
      a = { fg = colors.gray, bg = colors.outerbg, gui = "bold" },
      b = { fg = colors.gray, bg = colors.outerbg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    visual = {
      a = { fg = colors.darkgray, bg = colors.visual, gui = "bold" },
      b = { fg = colors.gray, bg = colors.outerbg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    replace = {
      a = { fg = colors.darkgray, bg = colors.replace, gui = "bold" },
      b = { fg = colors.gray, bg = colors.outerbg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    normal = {
      a = { fg = colors.darkgray, bg = colors.normal, gui = "bold" },
      b = { fg = colors.gray, bg = colors.outerbg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    insert = {
      a = { fg = colors.darkgray, bg = colors.insert, gui = "bold" },
      b = { fg = colors.gray, bg = colors.outerbg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    command = {
      a = { fg = colors.darkgray, bg = colors.command, gui = "bold" },
      b = { fg = colors.gray, bg = colors.outerbg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
  }
end

return {

  {
    "nvim-lualine/lualine.nvim",
    -- enabled = false,
    config = function()
      local status_ok, lualine = pcall(require, "lualine")
      if not status_ok then
        return
      end

      lualine.setup {
        options = {
          -- theme = "rose-pine",
          -- theme = theme(),
          theme = "auto",
          globalstatus = true,
          -- component_separators = "|",
          -- section_separators = "",
          -- local default_sep_icons = {
          -- default = { left = "", right = "" },
          -- block = { left = "█", right = "█" },
          -- arrow = { left = "", right = "" },

          component_separators = { left = ")", right = "(" },
          section_separators = { left = "", right = "" },
          icons_enabled = true,
          disabled_filetypes = { "dashboard", "NvimTree", "Outline", "alpha" },
          always_divide_middle = false,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { recording, recorded, "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      }
    end,
  },
}
