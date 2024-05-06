return {
  {
    -- Theme inspired by Atom
    "navarasu/onedark.nvim",
    enabled = false,
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
    enabled = false,
    lazy = false,
    priority = 1000,
  },
  {
    "folke/tokyonight.nvim",
    -- enabled = false,
    config = function()
      require("tokyonight").setup {
        transparent = true,
        -- style = "storm",
      }
      vim.cmd [[colorscheme tokyonight-night]]
    end,
  },
  {
    "rose-pine/neovim",
    enabled = false,
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      require("rose-pine").setup {
        disable_background = true,
        -- dim_inactive_windows = true,
        highlight_groups = {
          TelescopeBorder = { fg = "overlay", bg = "overlay" },
          TelescopeNormal = { fg = "subtle", bg = "overlay" },
          TelescopeSelection = { fg = "text", bg = "highlight_med" },
          TelescopeSelectionCaret = { fg = "love", bg = "highlight_med" },
          TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },
          TelescopeTitle = { fg = "base", bg = "love" },
          TelescopePromptTitle = { fg = "base", bg = "pine" },
          TelescopePreviewTitle = { fg = "base", bg = "iris" },
          TelescopePromptNormal = { fg = "text", bg = "surface" },
          TelescopePromptBorder = { fg = "surface", bg = "surface" },
          NeotreeNormal = { bg = "surface" },
          NormalFloat = { bg = "none" },
          NormalNC = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatShadow = { bg = "none" },
        },
      }
      -- vim.cmd.colorscheme "rose-pine"
      vim.cmd.colorscheme "rose-pine-moon"
    end,
  },
  {
    "catppuccin/nvim",
    enabled = false,
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup {
        -- flavour = "mocha",
        transparent_background = true,
      }
      vim.cmd.colorscheme "catppuccin"
    end,
  },
  {
    "Mofiqul/dracula.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      require("dracula").setup()
      require("lualine").setup {
        options = {
          theme = "dracula-nvim",
        },
      }
      vim.cmd.colorscheme "dracula"
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    enabled = false,
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
    enabled = false,
  },
  {
    "EdenEast/nightfox.nvim", -- https://github.com/EdenEast/nightfox.nvim
    enabled = false,
    config = function()
      require("nightfox").setup {
        options = {
          transparent = true,
        },
        -- palettes = {
        --   -- Custom duskfox with black background
        --   duskfox = {
        --     bg1 = "#000000", -- Black background
        --     bg0 = "#1d1d2b", -- Alt backgrounds (floats, statusline, ...)
        --     bg3 = "#121820", -- 55% darkened from stock
        --     sel0 = "#131b24", -- 55% darkened from stock
        --   },
        -- },
        -- specs = {
        --   all = {
        --     inactive = "bg0", -- Default value for other styles
        --   },
        --   duskfox = {
        --     inactive = "#090909", -- Slightly lighter then black background
        --   },
        -- },
        -- groups = {
        --   all = {
        --     NormalNC = { fg = "fg1", bg = "inactive" }, -- Non-current windows
        --   },
        -- },
      }
      vim.cmd "colorscheme nightfox"
      -- vim.cmd "colorscheme dayfox"
      -- vim.cmd "colorscheme dawnfox"
      -- vim.cmd "colorscheme duskfox"
      -- vim.cmd "colorscheme nordfox"
      -- vim.cmd "colorscheme terafox"
      -- vim.cmd "colorscheme carbonfox"
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
    enabled = false,
  },
  {
    "nanotech/jellybeans.vim", -- https://github.com/nanotech/jellybeans.vim
    enabled = false,
    lazy = false,
    config = function()
      vim.cmd "colorscheme jellybeans"
    end,
  },
  {
    "ribru17/bamboo.nvim", -- https://github.com/ribru17/bamboo.nvim
    enabled = false,
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
      require("bamboo").load()
    end,
  },
  {
    "savq/melange-nvim",
    enabled = false,
    config = function()
      vim.cmd "colorscheme melange"
    end,
  },
  {
    "Mofiqul/adwaita.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.adwaita_darker = true -- for darker version
      -- vim.g.adwaita_disable_cursorline = true -- to disable cursorline
      -- vim.g.adwaita_transparent = true -- makes the background transparent
      vim.cmd "colorscheme adwaita"
    end,
  },
  {
    "xero/miasma.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd "colorscheme miasma"
    end,
  },
}
