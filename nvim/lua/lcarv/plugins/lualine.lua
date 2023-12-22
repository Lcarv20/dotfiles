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

return {

  {
    "nvim-lualine/lualine.nvim",
    config = function()
      local status_ok, lualine = pcall(require, "lualine")
      if not status_ok then
        return
      end

      lualine.setup {
        options = {
          -- theme = "rose-pine",
          globalstatus = true,
          component_separators = "|",
          section_separators = "",
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
