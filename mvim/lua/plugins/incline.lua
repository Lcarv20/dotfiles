return {
	"b0o/incline.nvim",
	enabled = true,
  event = "VeryLazy",
	config = function()
		local colors = require("utils.colors").colors()
		local helpers = require("incline.helpers")
		local devicons = require("nvim-web-devicons")

		require("incline").setup({
			window = {
				padding = 0,
				margin = { vertical = 0, horizontal = 0 },
				placement = {
					horizontal = "right",
					vertical = "top",
				},
			},
			render = function(props)
				if not props.focused then
					return nil
				end
				local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")

				if filename == "" then
					filename = "[No Name]"
				end
				local ft_icon, ft_color = devicons.get_icon_color(filename)
				local modified = vim.bo[props.buf].modified
				return {
					ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
					" ",
					{ filename, gui = modified and "bold,italic" or "bold" },
					" ",
					guibg = colors.mutted,
				}
			end,
		})
	end,
}
