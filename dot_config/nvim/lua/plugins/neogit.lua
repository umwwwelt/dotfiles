return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration

		-- Only one of these is needed.
		"nvim-telescope/telescope.nvim", -- optional
	},

	config = function(_)
		vim.keymap.set("n", "<leader>gs", "<cmd>Neogit kind=floating<CR>", { desc = "Open [G]it" })
		vim.keymap.set("n", "<leader>dv", "<cmd>DiffviewOpen<CR>", { desc = "Open [D]iff[v]iew" })
		vim.keymap.set("n", "<leader>gc", "<cmd>DiffviewClose<CR>", { desc = "[G]it [C]lose Diffview" })
		vim.keymap.set("n", "<leader>fh", "<cmd>DiffviewFileHistory %<CR>", { desc = "[F]ile [H]istory" })
	end,
}
