require("config.options")
require("config.lazy")
require("config.autocmds")
require("config.keymaps")


require('experimental.apophis_dark_matter').setup({
    transparent = false, -- Disable transparency
    italic_comments = true,
    plugins = {
        -- Disable integration for a specific plugin if needed
        -- bufferline = false,
    },
    -- Example: Override a specific highlight group
    -- on_highlights = function(colors, config)
    --     return {
    --         CursorLine = { bg = '#333333' }, -- Make cursor line darker
    --         Comment = { fg = colors.accent, italic = config.italic_comments }, -- Use accent color for comments
    --     }
    -- end,
    -- Example: Override a specific color in the palette
    -- on_colors = function(colors)
    --     return {
    --         keyword = '#FF00FF', -- Make keywords magenta
    --     }
    -- end
})

