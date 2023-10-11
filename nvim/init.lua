require("lcarv")
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et


local colors = vim.fn.getcompletion("", "color")
vim.cmd("colorscheme " .. colors[math.random(1, #colors)])
