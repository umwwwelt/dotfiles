-- mapping
vim.g.mapleader = " "

-- visual move
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Cancel search highlight on <Esc>
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- delete entire word
vim.keymap.set("i", "<M-BS>", "<C-w>", { noremap = true })

-- cmd+s to save file
vim.keymap.set({ "n", "v" }, "<leader>w", ":write<CR>", { desc = "Save file" })

-- register d when deleting
vim.keymap.set({ "n", "v" }, "d", '"dd', { noremap = true })

-- rewrite goto like Helix
vim.keymap.set("n", "gh", "^", { desc = "Go the begining of the line" })
vim.keymap.set("n", "gl", "$", { desc = "Go the end of the line" })

-- move in autocompletion suggestionkeykey
---[[ Setup keymaps so we can accept completion using Enter and choose items using arrow keys or Tab.
-- local pumMaps = {
-- 	["<Tab>"] = "<C-n>",
-- 	["<S-Tab>"] = "<C-p>",
-- 	["<Down>"] = "<C-n>",
-- 	["<Up>"] = "<C-p>",
-- 	["<CR>"] = "<C-y>",
-- }
-- for insertKmap, pumKmap in pairs(pumMaps) do
-- 	vim.keymap.set("i", insertKmap, function()
-- 		return vim.fn.pumvisible() == 1 and pumKmap or insertKmap
-- 	end, { expr = true })
-- end
---]]

-- reload files
-- Execute current file, line, selection
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")

-- collapse nvim tree
vim.keymap.set("n", "<leader>tt", vim.cmd.NvimTreeToggle, { desc = "Nvim[T]ree [T]oggle" })
vim.keymap.set("n", "<leader>tc", vim.cmd.NvimTreeCollapse, { desc = "Nvim[T]ree [C]ollapse" })

-- inspect definitions
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })

-- Avante
vim.keymap.set("n", "<leader>ac", "<cmd>AvanteChatNew<Return>", { desc = "[C]lear [A]vante" })
