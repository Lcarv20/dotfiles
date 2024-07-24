local icons = require "lcarv.icons"

local remove_titles = function(opts)
  opts.prompt_title = false
  opts.results_title = false
  opts.preview_title = false
  return opts
end

-- List of default pickers provided by telescope
local pickers = {
  "find_files",
  "live_grep",
  "buffers",
  "help_tags",
  "oldfiles",
  "git_files",
  "git_commits",
  "git_branches",
  "git_status",
  "grep_string",
  "current_buffer_fuzzy_find",
  "commands",
  "command_history",
  "search_history",
  "man_pages",
  "marks",
  "registers",
  "keymaps",
  "filetypes",
  "highlights",
  "resume",
  "pickers",
  "lsp_references",
  "lsp_definitions",
  "lsp_implementations",
  "lsp_document_symbols",
  "lsp_workspace_symbols",
  "diagnostics",
}

local picker_configs = {}
for _, picker in ipairs(pickers) do
  picker_configs[picker] = remove_titles {}
end

return {
  {
    "nvim-telescope/telescope.nvim",
    -- tag = '0.1.8',
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable "make" == 1
        end,
      },
    },
    config = function()
      local telescope = require "telescope"

      telescope.setup {
        defaults = {
          prompt_prefix = " " .. icons.ui.Search .. " ",
          results_title = "",
          borderchars = {
            { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
            prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
            results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
            preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
          },
          sorting_strategy = "ascending", -- display results top->bottom
          layout_strategy = "flex",
          layout_config = {
            prompt_position = "top", -- search bar at the top
            horizontal = {
              width = 0.9,
              height = 0.6,
              -- size = {
              --   width = "90%",
              --   height = "60%",
              -- },
            },
            vertical = {
              width = 0.9,
              height = 0.9,
              -- size = {
              --   width = "90%",
              --   height = "90%",
              -- },
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          },
        },
        pickers = picker_configs,
      }

      telescope.load_extension "fzf"
    end,
  },
}
