return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
    "nvim-telescope/telescope.nvim", -- Optional: For using slash commands
    { "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves `vim.ui.select`
  },
  keys = {
    { "<leader>a", desc = "+ai", mode = { "n", "v" } },
    { "<leader>aa", "<cmd>CodeCompanionActions<cr>", desc = "toggle actions", mode = { "n", "v" } },
    { "<leader>ac", "<cmd>CodeCompanionChat<cr>", desc = "toggle chat", mode = { "n", "v" } },
    { "<leader>a+", "<cmd>CodeCompanionChat add<cr>", desc = "toggle chat", mode = "v" },
  },
  config = function()
    require("codecompanion").setup({
      -- adapters = {
      --   ollama = function()
      --     return require("codecompanion.adapters").extend("ollama", {
      --       name = "deepseek",
      --       schema = {
      --         model = {
      --           default = "llama3.1",
      --         },
      --         num_ctx = {
      --           default = 16384,
      --         },
      --         num_predict = {
      --           default = -1,
      --         },
      --       },
      --     })
      --   end,
      -- },
      -- display = {
      --   diff = {
      --     provider = "mini_diff",
      --   },
      -- },
      opts = {
        log_level = "DEBUG",
      },
      strategies = {
        chat = {
          -- adapter = "ollama",
          roles = {
            llm = " lc.AI", -- The markdown header content for the LLM's responses
            user = " Awesome Person", -- The markdown header for your questions
          },
        },
        -- inline = {
        --   adapter = "ollama",
        -- },
        -- agent = {
        --   adapter = "ollama",
        -- },
      },
    })

    -- Expand 'cc' into 'CodeCompanion' in the command line
    vim.cmd([[cab cc CodeCompanion]])
  end,
}
