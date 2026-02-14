-- Budget
-- vim.api.nvim_create_autocmd("VimEnter", {
-- 	callback = function()
-- 		local budget = require("custom.ai_budget").get_openai_budget()
-- 		vim.schedule(function()
-- 			vim.notify(budget, vim.log.levels.INFO, { title = "Budget OpenAI" })
-- 		end)
-- 	end,
-- })

-- highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
