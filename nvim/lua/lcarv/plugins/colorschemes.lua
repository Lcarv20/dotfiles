return {
  {
    -- Theme inspired by Atom
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "wadackel/vim-dogrun",
    lazy = false,
    priority = 1000,
  },
  {
    "folke/tokyonight.nvim",
    config = function() end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      require("rose-pine").setup {
        disable_background = true,
        dim_inactive_windows = true,
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
        },
      }
      function ColorMyPencils(color)
        color = color or "rose-pine"

        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      end

      ColorMyPencils()
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
  },
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    -- config = function()
    --   require("dracula").setup()
    --   require("lualine").setup {
    --     options = {
    --       theme = "dracula-nvim",
    --     },
    --   }
    -- end,
  },
  {
    "LunarVim/primer.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "rebelot/kanagawa.nvim",
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
        overrides = function(colors) -- add/modify highlights
          return {}
        end,
        theme = "wave", -- Load "wave" theme when 'background' option is not set
        background = { -- map the value of 'background' option to a theme
          dark = "dragon", -- try "dragon" !
          light = "lotus",
        },
      }
    end,
  },
  {
    "morhetz/gruvbox",
  },
  {
    "EdenEast/nightfox.nvim", -- https://github.com/EdenEast/nightfox.nvim
  },
  {
    "AlexvZyl/nordic.nvim", -- https://github.com/AlexvZyl/nordic.nvim?tab=readme-ov-file
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
        bright_border = true,
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
          theme = "dark",
          -- Blending the cursorline bg with the buffer bg.
          blend = 0.85,
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
          disable_background = true,
          -- Available styles: 'classic', 'flat'.
          style = "flat",
          dark_background = true,
        },
      }
    end,
  },
  {
    "cocopon/iceberg.vim", -- https://github.com/cocopon/iceberg.vim
  },
  {
    "nanotech/jellybeans.vim", -- https://github.com/nanotech/jellybeans.vim
  },
  {
    "ribru17/bamboo.nvim", -- https://github.com/ribru17/bamboo.nvim
    lazy = false,
    priority = 1000,
    -- config = function()
    --   require("bamboo").setup {
    --     -- optional configuration here
    --   }
    --   require("bamboo").load()
    -- end,
  },
  { "savq/melange-nvim" },
}
