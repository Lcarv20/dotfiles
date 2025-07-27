return {
	"yetone/avante.nvim",
	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	-- ⚠️ must add this setting! ! !
	build = "make",
	-- enabled = false,
	event = "VeryLazy",
	version = false, -- Never set this value to "*"! Never!
	---@module 'avante'
	---@type avante.Config
	opts = {
		-- provider = "openrouter",
		-- providers = {
		-- 	openrouter = {
		-- 		__inherited_from = "openai",
		-- 		endpoint = "https://openrouter.ai/api/v1",
		-- 		api_key_name = "OPENROUTER_API_KEY",
		-- 		model = "qwen/qwen3-coder:free",
		-- 	},
		-- },
		provider = "gemini",
		providers = {
			gemini = {
				endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
				model = "gemini-2.5-flash",
				use_ReAct_prompt = true,
				extra_request_body = {
					generationConfig = {
						temperature = 0.75,
					},
				},
			},
		},
		picker = {
			provider = "snacks", -- "file_selector" | "fzf" | "mini.pick" | "telescope"
		},
		web_search_engine = {
			provider = "google", -- tavily, serpapi, google, kagi, brave, or searxng
		},
		input = {
			provider = "dressing", -- "native" | "dressing" | "snacks"
			provider_opts = {
				-- Snacks input configuration
				title = "Avante Input",
				icon = " ",
				placeholder = "Enter your API key...",
			},
		},
		windows = {
			input = {
				height = 8,
			},
		},
	},

	-- keys = {
	-- 	{ "at", "<cmd>AvanteToggle<cr>", desc = "Toggle Avante" },
	-- 	{ "an", "<cmd>AvanteChatNew<cr>", desc = "New Avante chat" },
	-- 	{ "ac", "<cmd>AvanteChat<cr>", desc = "Open Avante chat" },
	-- 	{ "aa", "<cmd>AvanteAsk<cr>", desc = "Ask Avante" },
	-- 	{ "as", "<cmd>AvanteStop<cr>", desc = "Stop Avante" },
	-- 	{ "am", "<cmd>AvanteShowRepoMap<cr>", desc = "Show Avante repo map" },
	-- 	{ "ah", "<cmd>AvanteHistory<cr>", desc = "Show Avante history" },
	-- 	{ "aC", "<cmd>AvanteClear<cr>", desc = "Clear Avante chat" },
	-- 	{ "ae", "<cmd>AvanteEdit<cr>", desc = "Edit Avante" },
	-- 	{ "af", "<cmd>AvanteFocus<cr>", desc = "Focus Avante" },
	-- 	{ "am", "<cmd>AvanteModels<cr>", desc = "Show Avante models" },
	-- 	{ "ar", "<cmd>AvanteRefresh<cr>", desc = "Show Avante models" },
	-- },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		"echasnovski/mini.pick", -- for file_selector provider mini.pick
		"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
		"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
		"ibhagwan/fzf-lua", -- for file_selector provider fzf
		"stevearc/dressing.nvim", -- for input provider dressing
		"folke/snacks.nvim", -- for input provider snacks
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		"zbirenbaum/copilot.lua", -- for providers='copilot'
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
				},
			},
		},
	},
}
