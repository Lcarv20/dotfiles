-- lua/apophis_dark_matter/config.lua
local M = {}

---@class ApophisConfig
M.defaults = {
  style = "dark_matter", -- Default style (can add more later)
  transparent = false, -- Enable transparent background
  terminal_colors = true, -- Configure vim's terminal colors
  italic_comments = true, -- Use italics for comments

  -- Enable/disable integrations for specific plugins
  plugins = {
    telescope = true,
    nvim_tree = true,
    indent_blankline = true,
    which_key = true,
    bufferline = true,
    lualine = true,
    gitsigns = true,
    -- Add more plugins as needed
  },

  -- Function to override specific highlight groups
  ---@param colors ApophisColors The color palette
  ---@param config ApophisConfig The final configuration table
  ---@return table<string, vim.api.keyset.highlight>|nil A table of highlight group overrides
  on_highlights = nil,

  -- Function to override specific colors
  ---@param colors ApophisColors The color palette
  ---@return table<string, string>|nil A table of color overrides
  on_colors = nil,
}

M.options = {}

--- Merges user options with defaults.
---@param opts table|nil User configuration options
function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", vim.deepcopy(M.defaults), opts or {})
end

--- Returns the final configuration table.
---@return ApophisConfig
function M.get()
  return M.options
end

return M