local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local sorters = require("telescope.sorters")
local themes = require("telescope.themes")
local conf = require("telescope.config").values
local make_entry = require("telescope.make_entry")

local M = {}

local live_multigrep = function(opts)
	opts = opts or {}
	opts.cwd = opts.cwd or vim.uv.cwd()

	local finder = finders.new_async_job({
		command_generator = function(prompt)
			if not prompt or prompt == "" then
				return nil
			end

			local sections = vim.split(prompt, "  ")
			local args = { "rg" }

			if sections[1] then
				table.insert(args, "-e")
				table.insert(args, sections[1])
			end
			if sections[2] then
				table.insert(args, "-g")
				table.insert(args, sections[2])
			end

			table.insert(args, "--hidden")
			table.insert(args, "--glob")
			table.insert(args, "!**/.git/*")

			---@diagnostic disable-next-line: deprecated
			return vim.tbl_flatten({
				args,
				{ "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
			})
		end,
		entry_maker = make_entry.gen_from_vimgrep(opts),
		cwd = opts.cwd,
	})

	pickers
		.new(
			opts,
			themes.get_ivy({
				debounce = 100,
				prompt_title = "Grep search",
				finder = finder,
				previewer = conf.grep_previewer(opts),
				sorter = sorters.empty(),
			})
		)
		:find()
end
M.search = live_multigrep

return M
