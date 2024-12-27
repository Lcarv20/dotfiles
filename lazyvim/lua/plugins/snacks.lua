local logo = [[
 ✦   ████ ✧     ✦           ☆        ✦     ☆        
  ☆ ░░███     ✧   ☆  ✧    ✦  ✧            ✧     ✧ ☆ 
     ░███  ☆██████  ██████  ████████☆ █████ █████  ✧
✦  ☆ ░███  ███░░███░░░░░███░░███░░███░░███ ░░███ ✧  
     ░███ ░███ ░░░  ███████ ░███ ░░░  ░███  ░███    
   ✧ ░███ ░███  ███░██░░███ ░███  ✦   ░░███ ███  ✦  
     █████░░██████░░█████████████   ✧  ░░█████  ☆   
☆   ░░░░░✦ ░░░░░░☆ ░░░░░░░░░░░░░ ✧     ✦░░░░░     ✦ 
   ✧    ✧    ☆      ✧  ✦       ☆       ☆  ✧   ✦     
]]

return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    local default_keys = opts.dashboard.preset.keys

    default_keys[#default_keys + 1] = {
      icon = " ",
      key = "C",
      desc = "Lazy Changelog",
      action = function()
        LazyVim.news.changelog()
      end,
      enabled = package.loaded.lazy ~= nil,
    }

    local config = {
      notifier = {
        top_down = false,
      },
      dashboard = {
        preset = {
          header = logo,
          keys = default_keys,
        },
        sections = {
          { section = "header" },
          {
            pane = 2,
            section = "terminal",
            cmd = "$HOME/.dotfiles/zsh/colorscript",
            height = 5,
            padding = 1,
          },
          { section = "keys", gap = 1, padding = 1 },
          { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          {
            pane = 2,
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = vim.fn.isdirectory(".git") == 1,
            cmd = "hub status --short --branch --renames",
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          },
          { section = "startup" },
        },
      },
    }
    return config
  end,
}
