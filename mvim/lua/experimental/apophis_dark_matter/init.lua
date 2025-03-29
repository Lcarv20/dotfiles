-- lua/apophis_dark_matter/init.lua
local config_module = require("experimental.apophis_dark_matter.config")
local colors_module = require("experimental.apophis_dark_matter.colors")
local highlights_module = require("experimental.apophis_dark_matter.highlights")

local M = {}

-- Store the last used options to allow reloading with `colorscheme` command
local last_opts = nil

--- Loads the colorscheme.
--- This function is called by `setup` and can also be called directly
--- via `require('apophis_dark_matter').load()` or `vim.cmd 'colorscheme apophis_dark_matter'`
---@param theme_name string? The name of the theme style to load (defaults to config or 'dark_matter')
function M.load(theme_name)
  -- Use last known opts if available, otherwise use defaults
  local opts = last_opts or {}
  if theme_name then
    opts.style = theme_name -- Allow overriding style via load() argument
  end

  -- Ensure termguicolors is enabled before setting highlights
  vim.o.termguicolors = true
  vim.o.background = "dark" -- Assuming dark theme for now

  -- Process configuration (merges defaults with opts)
  config_module.setup(opts)
  local config = config_module.get()

  -- Get the base color palette for the style
  local colors = colors_module.get(config)

  -- Apply user color overrides if `on_colors` function exists
  if config.on_colors then
    local color_overrides = config.on_colors(colors)
    if type(color_overrides) == "table" then
      for name, value in pairs(color_overrides) do
        if type(value) == "string" then
          colors[name] = value
        end
      end
    end
  end

  -- Clear existing highlights (important for theme switching)
  -- We use a pattern that should match most highlight groups
  vim.cmd("highlight clear")
  -- Additionally clear syntax highlighting if 'syntax reset' exists
  if vim.fn.exists("syntax") == 1 then
      vim.cmd("syntax reset")
  end


  -- Set the theme name globally
  vim.g.colors_name = "apophis_" .. config.style

  -- Apply the highlight groups
  highlights_module.setup(colors, config)

  print("Apophis Dark Matter theme loaded.")
end

--- Sets up the colorscheme with user options.
---@param opts table? User configuration options (see config.lua for defaults)
function M.setup(opts)
  -- Store the options so they can be reused by M.load() if the user
  -- calls `:colorscheme apophis_dark_matter` later.
  last_opts = opts or {}
  M.load() -- Call load with the processed options
end

return M
