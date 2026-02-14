vim.api.nvim_create_autocmd("FileType", {
	pattern = "svelte",
	callback = function()
		vim.keymap.set("n", "<leader>s", function()
			local word = vim.fn.expand("<cword>")
			-- Find the line number of the first <style
			local style_line = nil
			for i = 1, vim.fn.line("$") do
				local line = vim.fn.getline(i)
				if line:find("<style") then
					style_line = i
					break
				end
			end
			if not style_line then
				print("Aucune balise <style> trouvée dans ce fichier.")
				return
			end
			-- Move cursor to the <style line
			-- vim.api.nvim_win_set_cursor(0, { style_line, 0 })
			-- local search_patterns = {
			-- 	"^%s*%.%s*" .. word .. "%s*{", -- For classes: .my-class {
			-- 	"^%s*#%s*" .. word .. "%s*{", -- For ids: #my-id {
			-- }
			-- local found = false
			-- for _, pattern in ipairs(search_patterns) do
			-- 	if vim.fn.search(pattern, "W") > 0 then
			-- 		found = true
			-- 		break
			-- 	end
			-- end
			-- if not found then
			-- 	print("Définition CSS non trouvée pour '" .. word .. "'.")
			-- end
		end, { desc = "Aller à la définition CSS", buffer = true })
	end,
})
