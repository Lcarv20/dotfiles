return {
  {
    -- Theme inspired by Atom
    "navarasu/onedark.nvim",
    -- enabled = false,
    lazy = false,
    priority = 1000,
  },
  {
    "Mofiqul/vscode.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
  },
  {
    "wadackel/vim-dogrun",
    -- enabled = false,
    lazy = false,
    priority = 1000,
  },
  {
    "folke/tokyonight.nvim",
    -- enabled = false,
    config = function()
      require("tokyonight").setup {
        transparent = true,
      }
    end,
  },
  {
    "rose-pine/neovim",
    -- enabled = false,
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
      require("rose-pine").setup {
        disable_background = true,
      }
    end,
  },
  {
    "catppuccin/nvim",
    -- enabled = false,
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup {
        transparent_background = true,
      }
    end,
  },
  {
    "Mofiqul/dracula.nvim",
    -- enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      require("dracula").setup()
      -- require("lualine").setup {
      --   options = {
      --     theme = "dracula-nvim",
      --   },
      -- }
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    -- enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      -- Default options:
      require("kanagawa").setup {
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = true, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = { -- add/modify theme and palette colors
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        theme = "wave", -- Load "wave" theme when 'background' option is not set
        background = { -- map the value of 'background' option to a theme
          dark = "wave", -- try "dragon" !
          light = "lotus",
        },
      }
    end,
  },
  {
    "morhetz/gruvbox",
    -- enabled = false,
  },
  {
    "EdenEast/nightfox.nvim", -- https://github.com/EdenEast/nightfox.nvim
    enabled = false,
    config = function()
      require("nightfox").setup {
        options = {
          transparent = true,
        },
      }
    end,
  },
  {
    "AlexvZyl/nordic.nvim", -- https://github.com/AlexvZyl/nordic.nvim?tab=readme-ov-file
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      require("nordic").setup {
        -- This callback can be used to override the colors used in the palette.
        on_palette = function(palette)
          return palette
        end,
        -- Enable bold keywords.
        bold_keywords = false,
        -- Enable italic comments.
        italic_comments = true,
        -- Enable general editor background transparency.
        transparent_bg = true,
        -- Enable brighter float border.
        bright_border = false,
        -- Reduce the overall amount of blue in the theme (diverges from base Nord).
        reduced_blue = true,
        -- Swap the dark background with the normal one.
        swap_backgrounds = false,
        -- Override the styling of any highlight group.
        override = {},
        -- Cursorline options.  Also includes visual/selection.
        cursorline = {
          -- Bold font in cursorline.
          bold = false,
          -- Bold cursorline number.
          bold_number = true,
          -- Avialable styles: 'dark', 'light'.
          theme = "light",
          -- Blending the cursorline bg with the buffer bg.
          blend = 0,
        },
        telescope = {
          -- Available styles: `classic`, `flat`.
          style = "flat",
        },
        ts_context = {
          -- Enables dark background for treesitter-context window
          dark_background = true,
        },
        neotree = {
          -- Disable the background highlight for the Neo-tree window
          disable_background = false,
          -- Available styles: 'classic', 'flat'.
          style = "flat",
          dark_background = true,
        },
      }
    end,
  },
  {
    "cocopon/iceberg.vim", -- https://github.com/cocopon/iceberg.vim
    -- enabled = false,
  },
  {
    "nanotech/jellybeans.vim", -- https://github.com/nanotech/jellybeans.vim
    -- enabled = false,
    lazy = false,
  },
  {
    "ribru17/bamboo.nvim", -- https://github.com/ribru17/bamboo.nvim
    -- enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      require("bamboo").setup {
        -- optional configuration here
        style = "vulgaris", -- light, multiplex
        transparent = true,
        dim_inactive = false,
        term_colors = true,
        cmp_itemkind_reverse = false,
        lualine = {
          transparent = false,
        },
        diagnostics = {
          darker = true, -- darker colors for diagnostic
          undercurl = true, -- use undercurl instead of underline for diagnostics
          background = false, -- use background color for virtual text
        },
      }
      -- require("bamboo").load()
    end,
  },
  {
    "savq/melange-nvim",
    -- enabled = false,
    config = function() end,
  },
  {
    "Mofiqul/adwaita.nvim",
    -- enabled = false,
    lazy = false,
    priority = 1000,
    config = function() end,
  },
  {
    "xero/miasma.nvim",
    -- enabled = false,
    lazy = false,
    priority = 1000,
    config = function() end,
  },
  {
    "projekt0n/github-nvim-theme",
    config = function()
      require("github-theme").setup {
        options = {
          hide_end_of_buffer = true, -- Hide the '~' character at the end of the buffer for a cleaner look
          hide_nc_statusline = true, -- Override the underline style for non-active statuslines
          transparent = false, -- Disable setting background
          terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
          dim_inactive = false, -- Non focused panes set to alternative background
          module_default = true, -- Default enable value for modules
          styles = { -- Style to be applied to different syntax groups
            comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
            functions = "italic",
            keywords = "NONE",
            variables = "NONE",
            conditionals = "NONE",
            constants = "bold",
            numbers = "NONE",
            operators = "NONE",
            strings = "NONE",
            types = "NONE",
          },
          inverse = { -- Inverse highlight for different types
            match_paren = false,
            visual = false,
            search = false,
          },
          darken = { -- Darken floating windows and sidebar-like windows
            floats = false,
            sidebars = {
              enable = true,
              list = {}, -- Apply dark background to specific windows
            },
          },
          modules = { -- List of various plugins and additional options
            -- ...
          },
        },
        palettes = {},
        specs = {
          all = {
            diagnostics = {
              hint = "cyan.bright",
            },
          },
        },
        groups = {
          all = {
            ["@tag.builtin.tsx"] = { fg = "palette.yellow.bright" },
            ["@tag.tsx"] = { fg = "palette.orange.base" },
            String = { fg = "palette.cyan.bright" },
            NormalFloat = { bg = "bg1" },
            TelescopeBorder = { fg = "palette.black.bright" },
            LspInlayHint = { fg = "#8b949e", bg = "bg1" },
          },
        },
      }
    end,
  },
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require("everforest").setup {
        ---Controls the "hardness" of the background. Options are "soft", "medium" or "hard".
        ---Default is "medium".
        background = "hard",
        ---How much of the background should be transparent. 2 will have more UI
        ---components be transparent (e.g. status line background)
        transparent_background_level = 0,
        ---Whether italics should be used for keywords and more.
        italics = false,
        ---Disable italic fonts for comments. Comments are in italics by default, set
        ---this to `true` to make them _not_ italic!
        disable_italic_comments = false,
        ---By default, the colour of the sign column background is the same as the as normal text
        ---background, but you can use a grey background by setting this to `"grey"`.
        sign_column_background = "none",
        ---The contrast of line numbers, indent lines, etc. Options are `"high"` or
        ---`"low"` (default).
        ui_contrast = "low",
        ---Dim inactive windows. Only works in Neovim. Can look a bit weird with Telescope.
        ---When this option is used in conjunction with show_eob set to `false`, the
        ---end of the buffer will only be hidden inside the active window. Inside
        ---inactive windows, the end of buffer filler characters will be visible in
        ---dimmed symbols. This is due to the way Vim and Neovim handle `EndOfBuffer`.
        dim_inactive_windows = false,
        ---Some plugins support highlighting error/warning/info/hint texts, by
        ---default these texts are only underlined, but you can use this option to
        ---also highlight the background of them.
        diagnostic_text_highlight = false,
        ---Which colour the diagnostic text should be. Options are `"grey"` or `"coloured"` (default)
        diagnostic_virtual_text = "coloured",
        ---Some plugins support highlighting error/warning/info/hint lines, but this
        ---feature is disabled by default in this colour scheme.
        diagnostic_line_highlight = false,
        ---By default, this color scheme won't colour the foreground of |spell|, instead
        ---colored under curls will be used. If you also want to colour the foreground,
        ---set this option to `true`.
        spell_foreground = false,
        ---Whether to show the EndOfBuffer highlight.
        show_eob = true,
        ---Style used to make floating windows stand out from other windows. `"bright"`
        ---makes the background of these windows lighter than |hl-Normal|, whereas
        ---`"dim"` makes it darker.
        ---
        ---Floating windows include for instance diagnostic pop-ups, scrollable
        ---documentation windows from completion engines, overlay windows from
        ---installers, etc.
        ---
        ---NB: This is only significant for dark backgrounds as the light palettes
        ---have the same colour for both values in the switch.
        float_style = "bright",
        ---Inlay hints are special markers that are displayed inline with the code to
        ---provide you with additional information. You can use this option to customize
        ---the background color of inlay hints.
        ---
        ---Options are `"none"` or `"dimmed"`.
        inlay_hints_background = "none",
        ---You can override specific highlights to use other groups or a hex colour.
        ---This function will be called with the highlights and colour palette tables.
        ---@param highlight_groups Highlights
        ---@param palette Palette
        on_highlights = function(highlight_groups, palette) end,
        ---You can override colours in the palette to use different hex colours.
        ---This function will be called once the base and background colours have
        ---been mixed on the palette.
        ---@param palette Palette
        colours_override = function(palette) end,
      }
    end,
  },
}
