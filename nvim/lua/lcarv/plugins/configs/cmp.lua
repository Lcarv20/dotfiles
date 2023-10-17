local icons = require 'lcarv.icons'
return {
  'hrsh7th/nvim-cmp',
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
    "onsails/lspkind.nvim"
  },
  config = function()
    -- [[ Configure nvim-cmp ]]
    -- See `:help cmp`
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    require('luasnip.loaders.from_vscode').lazy_load()
    luasnip.config.setup {}
    ---@diagnostic disable-next-line: missing-fields
    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      -- window = {
      --   completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
      -- },
      mapping = cmp.mapping.preset.insert {
        -- ['<C-n>'] = cmp.mapping.select_next_item(),
        -- ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ['<C-n>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<C-p>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
      }, {
        { name = 'buffer' },
      }),
      formatting = {
        format = function(entry, vim_item)
          -- Kind icons
          -- if vim_item.kind == 'Color' then
          --   return require('tailwindcss-colorizer-cmp').formatter(entry, vim_item)
          -- end

          vim_item.kind = string.format('%s %s', icons.kind[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind

          -- Source
          vim_item.menu = ({
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            luasnip = "[LuaSnip]",
            nvim_lua = "[Lua]",
            latex_symbols = "[LaTeX]",
          })[entry.source.name]

          return require('tailwindcss-colorizer-cmp').formatter(entry, vim_item)
          -- return vim_item
        end
        -- format = function(entry, vim_item)
        --   local lspkind_ok, lspkind = pcall(require, "lspkind")
        --   if not lspkind_ok then
        --     -- From kind_icons array
        --     vim_item.kind = string.format('%s %s', icons.kind[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
        --     -- Source
        --     vim_item.menu = ({
        --       buffer = "[Buffer]",
        --       nvim_lsp = "[LSP]",
        --       luasnip = "[LuaSnip]",
        --       nvim_lua = "[Lua]",
        --       latex_symbols = "[LaTeX]",
        --     })[entry.source.name]
        --     return vim_item
        --   else
        --     -- From lspkind
        --     return lspkind.cmp_format({
        --       before = function(entry, vim_item)
        --         vim_item = require('tailwindcss-colorizer-cmp').formatter(entry, vim_item)
        --         return vim_item
        --       end
        --     })(entry, vim_item)
        --   end
        -- end
      }, }
  end
}
