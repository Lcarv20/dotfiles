local nmap = require("lcarv.fns").nmap
return {
  enabled = false,
  "David-Kunz/gen.nvim",
  opts = {
    -- model = "gemma2:latest", -- The default model to use.
    model = "codellama:13b",
    host = "localhost", -- The host running the Ollama service.
    port = "11434", -- The port on which the Ollama service is listening.
    quit_map = "q", -- set keymap for close the response window
    retry_map = "<c-r>", -- set keymap to re-send the current prompt
    init = function(options)
      pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
    end,
    -- Function to initialize Ollama
    command = function(options)
      local body = { model = options.model, stream = true }
      return "curl --silent --no-buffer -X POST http://" .. options.host .. ":" .. options.port .. "/api/chat -d $body"
    end,
    -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
    -- This can also be a command string.
    -- The executed command must return a JSON object with { response, context }
    -- (context property is optional).
    -- list_models = '<omitted lua function>', -- Retrieves a list of model names
    display_mode = "float", -- The display mode. Can be "float" or "split" or "horizontal-split".
    show_prompt = false, -- Shows the prompt submitted to Ollama.
    show_model = false, -- Displays which model you are using at the beginning of your chat session.
    no_auto_close = false, -- Never closes the window automatically.
    debug = false, -- Prints errors and the command which is run.
  },
  config = function()
    require("gen").prompts["Generate_JSdoc"] = {
      prompt = "Generate JSdoc for the following code, and add a brief description. Only ouput the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
      replace = false,
      extract = "```$filetype\n(.-)```",
    }

    vim.keymap.set({ "n", "v" }, "<leader>a", ":Gen<CR>", { desc = "[a]i", noremap = true })
    vim.keymap.set("v", "<leader>tj", ":Gen Generate_JSdoc<cr>", { desc = "Generate [j]Sdoc" })
  end,
}
