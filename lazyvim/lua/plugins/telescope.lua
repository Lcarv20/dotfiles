local no_preview_picker = {
  theme = "dropdown",
  previewer = false,
  layout_config = {
    anchor = "N", -- Positions the dropdown towards the top
    prompt_position = "top", -- Moves the prompt to the top of the window
  },
}

return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- disable the keymap to grep files
    { "<leader>/", false },
    { "<leader>,", false },
    { "<leader>:", false },
    { "<leader><space>", false },
  },
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          width = 0.8,
          height = 0.8,
          preview_width = 0.5,
        },
        vertical = {
          width = 0.9,
          height = 0.9,
          preview_height = 0.5,
        },
        prompt_position = "top",
        preview_cutoff = 80, -- Switches to vertical layout if window width is below 80 columns
      },
    },
    pickers = {
      find_files = no_preview_picker,
      oldfiles = no_preview_picker,
      buffers = no_preview_picker,
      git_commits = {
        theme = "ivy",
      },
      git_status = {
        theme = "ivy",
      },
    },
  },
}
