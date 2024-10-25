return {
  "Faywyn/llama-copilot.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  opts = {
    host = "localhost",
    port = "11434",
    model = "codellama:12b",
    max_completion_size = -1, -- use -1 for limitless
    debug = false,
  },
}
