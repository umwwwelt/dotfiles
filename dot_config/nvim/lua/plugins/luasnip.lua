return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
	opts = function(_, opts)
		local ls = require("luasnip")
		local s = ls.snippet
		local t = ls.text_node
		local i = ls.insert_node

		-- SVELTE
		ls.add_snippets("svelte", {
			s("script", {
				t({ '<script lang="ts">', "" }),
				i(1),
				t({ "", "</script>" }),
			}),
		})
	end,
}
