local TelescopePrompt = {
  -- Prompt
  TelescopePromptNormal = {
    bg = '#18181b',
    fg = '#d6d3d1'
  },
  TelescopePromptBorder = {
    bg = '#18181b',
    fg = '#18181b',
  },
  TelescopePromptTitle = {
    -- bg = '#18181b',
    fg = '#57534e',
  },

  -- Preview
  TelescopePreviewTitle = {
    fg = '#18181b',
    bg = '#18181b',
  },
  TelescopePreviewNormal = {
    -- fg = '#18181b',
    bg = '#18181b',
  },
  TelescopePreviewBorder = {
    -- NO BORDER
    -- fg = '#1F1F23',
    -- bg = '#18181b',
    --
    -- SPECIFIC FOR BORDERLINE
    fg = '#334155',
    bg = '#18181b',
  },

  -- Results whi
  TelescopeResultsTitle = {
    fg = '#1F1F23',
    bg = '#1F1F23',
  },
  TelescopeResultsNormal = {
    -- fg = '#1F1F23',
    bg = '#1F1F23',
  },
  TelescopeResultsBorder = {
    fg = '#1F1F23',
    bg = '#1F1F23',
  },
}
for hl, col in pairs(TelescopePrompt) do
  vim.api.nvim_set_hl(0, hl, col)
end
