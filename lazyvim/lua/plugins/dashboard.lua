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

logo = string.rep("\n", 8) .. logo .. "\n\n"

return {
  "nvimdev/dashboard-nvim",
  enabled = false,
  opts = function(_, opts)
    opts.config.header = vim.split(logo, "\n")
    -- Insert new entry into the existing center table
    table.insert(opts.config.center, {
      icon = " ",
      -- icon_hl = "Title",
      desc = " LazyVim Changelog             ",
      -- desc_hl = "String",
      key = "L",
      -- key_hl = "Number",
      key_format = "  %s", -- remove default surrounding `[]`
      action = function()
        LazyVim.news.changelog()
      end,
    })
  end,
}
