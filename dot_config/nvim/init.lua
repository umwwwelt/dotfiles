require("config.lazy")
require("keymap")
require("config.autocmd")

-- sync clipboard
vim.opt.clipboard = "unnamedplus"

-- number colon
vim.opt.number = true
vim.opt.relativenumber = true

-- ligatures
vim.opt.termguicolors = true

-- no ~ for end lines
vim.opt.fillchars:append({ eob = " " }) -- eob = end-of-buffer

-- encoding / icons
--vim.opt.ambiwidth = "double"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- scroll padding
vim.opt.scrolloff = 15
vim.bo.modifiable = true

-- set
vim.opt.incsearch = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Save undo history
vim.opt.undofile = true

-- autocompletion
-- vim.lsp.completion.enable(true, {autotrigger=true})

-- modification out
-- vim.opt.wrap = false -- do not wrap text but insert EOL instead
vim.opt.textwidth = 100
vim.opt.cursorline = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.inccommand = "split"

-- gouttiere
vim.opt.signcolumn = "yes"
vim.diagnostic.config({
	virtual_text = false,
	virtual_lines = { current_line = true },
	underline = false,
	italic = false,
	signs = {
		text = {
			[vim.diagnostic.severity.HINT] = "",
			[vim.diagnostic.severity.ERROR] = "✘",
			[vim.diagnostic.severity.INFO] = "◉",
			[vim.diagnostic.severity.WARN] = "",
		},
	},
})
vim.api.nvim_set_hl(0, "Deprecated", { strikethrough = true })
-- undo
vim.opt.undofile = true

-- blink avante
vim.api.nvim_set_hl(0, "BlinkCmpKindAvante", { default = false, fg = "#89b4fa" })

vim.api.nvim_create_user_command("WrapConsoleTime", function()
	local line_num = vim.fn.line(".")
	local var = vim.fn.expand("<cword>") or "myTimer"
	vim.fn.append(line_num - 1, 'console.time("' .. var .. '");')
	vim.fn.append(line_num + 1, 'console.timeEnd("' .. var .. '");')
end, {})

-- NeoVide config only
-- if vim.g.neovide then
-- 	-- Put anything you want to happen only in Neovide here
-- 	local alpha = function()
-- 		return string.format("%x", math.floor(255 * vim.g.neovide_opacity_point or 0.8))
-- 	end
-- 	-- Set transparency and background color (title bar color)
-- 	vim.g.neovide_opacity = 0.0
-- 	vim.g.neovide_opacity_point = 0.9
-- 	vim.g.neovide_background_color = "#0f1117" .. alpha()
-- 	vim.g.neovide_blur_amount_x = 10
-- 	vim.g.neovide_blur_amount_y = 10
-- 	vim.g.neovide_winblend = 10
-- 	vim.g.neovide_pumblend = 10
--
-- 	vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
-- 	vim.keymap.set("v", "<D-c>", '"+y') -- Copy
-- 	vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
-- 	vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
-- 	vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
-- 	vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
-- end
