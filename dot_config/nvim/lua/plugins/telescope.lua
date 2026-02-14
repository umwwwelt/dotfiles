return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		"nvim-tree/nvim-web-devicons", -- requires Nerd font
		"debugloop/telescope-undo.nvim",
	},

	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")
		local multigrep = require("config.multigrep")

		telescope.setup({
			pickers = {
				find_files = {
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
				},
				buffers = {
					mappings = {
						i = {
							["<c-d>"] = actions.delete_buffer + actions.move_to_top,
						},
					},
				},
			},
			defaults = {
				winblend = 10,
			},
			extensions = {
				fzf = {},
				undo = {},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("undo")

		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>sg", multigrep.search, { desc = "[S]earch with [G]rep" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		vim.keymap.set("n", "<leader>st", builtin.help_tags, { desc = "[S]earch [T]elescope help" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader>s.", builtin.resume, { desc = "[S]earch resume ('.' for repeat)" })
		vim.keymap.set("n", "<leader>sr", builtin.oldfiles, { desc = "[S]earch [R]ecent Files" })
		vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "[S]earch existing [B]uffers" })
		vim.keymap.set(
			"n",
			"<leader>sm",
			"<cmd>Telescope marks mark_type=global<cr>",
			{ desc = "[S]earch existing [M]arks" }
		)
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
		vim.keymap.set("n", "<leader>su", "<cmd>Telescope undo<cr>", { desc = "[S]earch [U]ndo" })
		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(themes.get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })
		vim.keymap.set("n", "<leader>sn", function()
			local opts = {
				cwd = vim.fn.stdpath("config"),
				prompt_title = "Search Neovim config",
			}
			builtin.find_files(opts)
		end, { desc = "[S]earch [N]eovim config" })
	end,
}
