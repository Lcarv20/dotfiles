require("config.options")
require("config.lazy")
require("config.autocmds")
require("config.keymaps")
if vim.g.neovide then
	require("config.neovide")
end

vim.ui.input = require("snacks").input
vim.ui.select = require("snacks").picker.select
