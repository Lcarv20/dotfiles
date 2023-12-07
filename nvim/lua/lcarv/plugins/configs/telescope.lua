local icons = require "lcarv.icons"

local file_browser_opts = function(fb_actions)
  local opts = {
    initial_mode = "normal",
    hijack_netrw = true,
    theme = "dropdown",
    path = vim.loop.cwd(),
    cwd = vim.loop.cwd(),
    cwd_to_path = false,
    grouped = false,
    files = true,
    add_dirs = true,
    depth = 1,
    auto_depth = true,
    select_buffer = false,
    hidden = { file_browser = false, folder_browser = false },
    respect_gitignore = vim.fn.executable "fd" == 1,
    follow_symlinks = false,
    browse_files = require("telescope._extensions.file_browser.finders").browse_files,
    browse_folders = require("telescope._extensions.file_browser.finders").browse_folders,
    hide_parent_dir = true,
    collapse_dirs = false,
    prompt_path = false,
    quiet = false,
    dir_icon = icons.ui.Folder,
    dir_icon_hl = "Default",
    display_stat = { date = true, size = true, mode = true },
    use_fd = true,
    git_status = true,
    mappings = {
      ["i"] = {
        ["<A-c>"] = fb_actions.create,
        ["<S-CR>"] = fb_actions.create_from_prompt,
        ["<A-r>"] = fb_actions.rename,
        ["<A-m>"] = fb_actions.move,
        ["<A-y>"] = fb_actions.copy,
        ["<A-d>"] = fb_actions.remove,
        ["<C-o>"] = fb_actions.open,
        ["<C-g>"] = fb_actions.goto_parent_dir,
        ["<C-e>"] = fb_actions.goto_home_dir,
        ["<C-w>"] = fb_actions.goto_cwd,
        ["<C-t>"] = fb_actions.change_cwd,
        ["<C-f>"] = fb_actions.toggle_browser,
        ["<C-h>"] = fb_actions.toggle_hidden,
        ["<C-s>"] = fb_actions.toggle_all,
        ["<bs>"] = fb_actions.backspace,
      },
      ["n"] = {
        ["c"] = fb_actions.create,
        ["r"] = fb_actions.rename,
        ["m"] = fb_actions.move,
        ["y"] = fb_actions.copy,
        ["d"] = fb_actions.remove,
        ["o"] = fb_actions.open,
        ["g"] = fb_actions.goto_parent_dir,
        ["e"] = fb_actions.goto_home_dir,
        ["w"] = fb_actions.goto_cwd,
        ["t"] = fb_actions.change_cwd,
        ["f"] = fb_actions.toggle_browser,
        ["h"] = fb_actions.toggle_hidden,
        ["s"] = fb_actions.toggle_all,
      },
    },
  }
  return opts
end

return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = "make",
        cond = function()
          return vim.fn.executable "make" == 1
        end,
      },
      "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function()
      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      local telescope = require "telescope"
      local fb_actions = require "telescope._extensions.file_browser.actions"
      telescope.setup {
        defaults = {
          prompt_prefix = " " .. icons.ui.Search .. " ",
          -- borderchars = {
          --     prompt = { ' ', ' ', '⎯', ' ', ' ', ' ', ' ', ' ' },
          --     results = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
          --     preview = { ' ', ' ', ' ', '▏', '▏', ' ', ' ', '▏' },
          -- },
          sorting_strategy = "ascending", -- display results top->bottom
          layout_config = {
            prompt_position = "top",      -- search bar at the top
          },
          mappings = {
            i = {
              ["<C-u>"] = false,
              ["<C-d>"] = false,
            },
          },
        },
        extensions = {
          file_browser = file_browser_opts(fb_actions),
        },
      }

      -- Enable telescope fzf native, if installed
      telescope.load_extension "fzf"
      -- Enable notify.nvim
      -- telescope.load_extension("notify")
      require("telescope").load_extension "file_browser"
    end,
  },
}
