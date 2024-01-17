return {
  "toppair/peek.nvim",
  event = { "VeryLazy" },
  build = "deno task --quiet build:fast",
  config = function()
    require("peek").setup({
    theme = "dark",
    -- app = "browser", -- default "webview"
    })
    -- refer to `configuration to change defaults`
    vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
    vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
  end,
}
