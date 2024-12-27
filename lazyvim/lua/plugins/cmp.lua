return {
  "hrsh7th/nvim-cmp",
  enabled = false,
  dependencies = { "hrsh7th/cmp-emoji",  "Lcarv20/cmp-tw2css", },
  -- keys = {
  --   { "<Tab>", mode = { "i", "s" }, false },
  -- },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local cmp = require("cmp")
    -- opts.experimental.ghost_text = false

    opts.preselect = cmp.PreselectMode.None
    opts.completion = {
      completeopt = "menu,menuone,noinsert,noselect",
    }

    table.insert(opts.sources, { name = "emoji" })
    -- table.insert(opts.sources, { name = "supermaven" })
    table.insert(opts.sources, { name = "cmp-tw2css" })

    opts.mapping = vim.tbl_extend("force", opts.mapping, {
      -- My config
      ["<CR>"] = cmp.mapping.confirm({ select = false }), -- 'select = false' to only confirm explicitly selected item
    })
  end,
}
