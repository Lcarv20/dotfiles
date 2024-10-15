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
  "nvim-lualine/lualine.nvim",
  opts = {
    theme = "auto",
    options = {
      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
    },
  },
}
