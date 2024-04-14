return {
  "otavioschwanck/arrow.nvim",
  event = "VeryLazy",
  config = function()
    require("arrow").setup {
      show_icons = true,
      always_show_path = false,
      separate_by_branch = false, -- Bookmarks will be separated by git branch
      hide_handbook = false, -- set to true to hide the shortcuts on menu.
      save_path = function()
        return vim.fn.stdpath "cache" .. "/arrow"
      end,
      mappings = {
        edit = "e",
        delete_mode = "d",
        clear_all_items = "C",
        toggle = "s",
        open_vertical = "v",
        open_horizontal = "-",
        quit = "q",
        remove = "x",
      },
      window = {
        width = "auto",
        height = "auto",
        row = "auto",
        col = "auto",
        border = "single",
      },
      separate_save_and_remove = false,
      leader_key = ";",
      global_bookmarks = false,
      index_keys = "123456789zxcbnmZXVBNM,afghjklAFGHJKLwrtyuiopWRTYUIOP", -- keys mapped to bookmark index, i.e. 1st bookmark will be accessible by 1, and 12th - by c
      full_path_list = { "page", "route" }, -- filenames on this list will ALWAYS show the file path too.
    }
  end,
}
