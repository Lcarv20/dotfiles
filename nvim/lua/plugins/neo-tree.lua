return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    { "<Leader>E", false },
  },
  opts = {
    popup_border_style = "solid",
    source_selector = {
      winbar = false,
      statusline = false,
    },
    filesystem = {
      hijack_netrw_behavior = "disabled",
      follow_current_file = {
        enabled = true, -- This will find and focus the file in the active buffer every time
        --               -- the current file is changed while the tree is open.
        leave_dirs_open = true, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
      },
    },
    event_handlers = {
      {
        event = "neo_tree_buffer_enter",
        handler = function(_)
          -- vim.cmd [[setlocal relativenumber]]
          vim.opt_local.relativenumber = true
        end,
        id = "neo_tree_set_relative_number",
      },
      {
        event = "neo_tree_buffer_leave",
        handler = function(_)
          -- close neotree
          vim.cmd([[Neotree close]])
        end,
        id = "neo_tree_set_relative_number",
      },
    },
  },
}
