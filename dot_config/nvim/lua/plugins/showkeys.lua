return {
	"nvzone/showkeys",
	enabled = false,
	cmd = "ShowkeysToggle",
	event = "VimEnter",
	opts = {
		timeout = 1,
		show_count = true,
		maxkeys = 5,
		position = "bottom-right",

		-- more opts
		winopts = {
			focusable = false,
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		},
		excluded_modes = { "i" },
	},
}
