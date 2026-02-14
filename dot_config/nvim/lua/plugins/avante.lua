return {
	{
		"yetone/avante.nvim",
		enabled = true,
		event = "VeryLazy",
		version = false, -- Never set this value to "*"! Never!
		opts = {
			-- add any opts here
			-- for example avante
			provider = "openai",
			providers = {
				openai = {
					endpoint = "https://api.openai.com/v1",
					model = "gpt-4.1-2025-04-14",
					api_key_name = "OPENAI_API_KEY",
					__inherited_from = "openai",
				},
				claude = {
					model = "claude-3-7-sonnet-latest",
				},
				gemini = {
					model = "gemini-2.5-flash-preview-04-17",
				},
				mistral = {
					__inherited_from = "openai",
					api_key_name = "MISTRAL_API_KEY",
					endpoint = "https://api.mistral.ai/v1/",
					model = "codestral-latest",
				},
			},
			auto_suggestions_provider = "openai",
			memory_summary_provider = "gemini",
			cursor_applying_provider = "gemini",
			suggestion = {
				debounce = 300,
				throttle = 1000,
			},
			rag_service = {
				enabled = false, -- Enables the RAG service
				host_mount = os.getenv("HOME/Users/tantra/Code/"), -- Host mount path for the rag service
				provider = "openai", -- The provider to use for RAG service (e.g. openai or ollama)
				llm_model = "4o-mini", -- The LLM model to use for RAG service
				embed_model = "text-embedding-ada-002", -- The embedding model to use for RAG service
			},
			web_search_engine = {
				provider = "brave",
			},
			behaviour = {
				auto_suggestions = false,
				enable_cursor_planning_mode = false,
				auto_suggestions_respect_ignore = true,
				enable_claude_text_editor_tool_mode = false,
				use_cwd_as_project_root = false,
			},
			mappings = {
				suggestion = {
					accept = "<Tab>",
				},
				ask = "<leader>aa",
				files = {
					add_current = "<leader>aw",
				},
			},
			windows = {
				sidebar_header = {
					rounded = false,
					align = "left",
					auto_scroll = false,
				},
				edit = {
					border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
					start_insert = true,
				},
			},
		},
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"echasnovski/mini.pick", -- for file_selector provider mini.pick
			"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
			"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
			"ibhagwan/fzf-lua", -- for file_selector provider fzf
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
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
}
