local icons = require "lcarv.icons"

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    {
      "hrsh7th/cmp-nvim-lsp",
      event = "InsertEnter",
    },
    {
      "hrsh7th/cmp-emoji",
      event = "InsertEnter",
    },
    {
      "hrsh7th/cmp-buffer",
      event = "InsertEnter",
    },
    {
      "hrsh7th/cmp-path",
      event = "InsertEnter",
    },
    {
      "hrsh7th/cmp-cmdline",
      event = "InsertEnter",
    },
    {
      "saadparwaiz1/cmp_luasnip",
      event = "InsertEnter",
    },
    {
      "L3MON4D3/LuaSnip",
      event = "InsertEnter",
      dependencies = {
        "rafamadriz/friendly-snippets",
      },
    },
    {
      "hrsh7th/cmp-nvim-lua",
    },
    -- "onsails/lspkind.nvim",
  },
  config = function()
    local cmp = require "cmp"
    local luasnip = require "luasnip"
    -- require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_vscode").lazy_load {
      paths = { "~/.config/nvim/snippets" },
    }

    luasnip.config.setup {}
    ---@diagnostic disable-next-line: missing-fields
    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      -- window = {
      --   completion = {
      --     border = "single",
      --     winhighlight = "Normal:CmpNormal",
      --     scrollbar = true,
      --   },
      --   documentation = {
      --     border = "single",
      --     winhighlight = "Normal:CmpNormal",
      --     scrollbar = true,
      --   },
      -- },
      mapping = cmp.mapping.preset.insert {
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete {},
        ["<CR>"] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        },
        -- ["<C-n>"] = cmp.mapping(function(fallback)
        --   if cmp.visible() then
        --     cmp.select_next_item()
        --   elseif luasnip.expand_or_locally_jumpable() then
        --     luasnip.expand_or_jump()
        --   else
        --     fallback()
        --   end
        -- end, { "i", "s" }),
        -- ["<C-p>"] = cmp.mapping(function(fallback)
        --   if cmp.visible() then
        --     cmp.select_prev_item()
        --   elseif luasnip.locally_jumpable(-1) then
        --     luasnip.jump(-1)
        --   else
        --     fallback()
        --   end
        -- end, { "i", "s" }),
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- For luasnip users.
        { name = "codeium" },
      }, {
        { name = "buffer" },
        { name = "emoji" },
        { name = "path" },
        { name = "nvim_lua" },
      }),
      formatting = {
        expandable_indicator = true,
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          local kind = vim_item.kind

          vim_item.kind = " " .. icons.kind[kind] .. " "

          -- Source
          vim_item.menu = "["
            .. ({
              latex_symbols = "LaTeX",
              codeium = "",
              nvim_lsp = "󰚥",
              luasnip = "",
              nvim_lua = "󰢱",
              buffer = "",
              path = "",
              emoji = "󰱫",
              nerdfont = "󰊪",
              calc = "󰃬",
              bufname = "󰈬",
            })[entry.source.name]
            .. " "
            .. kind
            .. "]"

          return require("tailwindcss-colorizer-cmp").formatter(entry, vim_item)
        end,
      },
    }
  end,
}
