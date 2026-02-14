return {
	{
		"catppuccin/nvim",
		enabled = true,
		Name = "catppuccin",
		priority = 1000,
		config = function()
			-- theme
			require("catppuccin").setup({
				flavor = "latte",
				transparent_background = true,
				term_colors = true,
				styles = {
					attributes = {},
					comments = {},
					keywords = { "italic" },
				},
				color_overrides = {
					mocha = {
						green = "#5FFFB2", -- inchangé
						lavender = "#E1AFFF", -- violet clair très saturé
						mauve = "#886bc2", -- violet électrique
						peach = "#f79e54",
						rosedarker = "#FF3C5E", -- rose/rouge très éclatant
						red = "#FF4D4D", -- rouge vif
						reddarker = "#b23535",
						cyan = "#00988e",
						cyandarker = "#005c56",
						svelte = "#ff3e00", -- inchangé
						paleblue = "#A3F7FF", -- bleu ciel très lumineux
						paledarker = "#5DCAD6", -- turquoise saturé
						blue = "#3EBEFF", -- bleu électrique
						tsblue = "#007ACC", -- inchangé
						tsdarker = "#0063A6", -- bleu foncé mais plus saturé
						surface1 = "#474352", -- gris très clair
						surface2 = "#625c70", -- gris profond, un peu bleuté
						yellow = "#f7d302",
						yellowdark = "#5c4e01",
						trans = "#0F1413", -- noir doux avec un peu plus de lumière
					},
				},
				custom_highlights = function(colors)
					---@diagnostic disable: undefined-field
					return {
						-- NVIM
						TelescopeBorder = { fg = colors.cyan },
						NoiceCmdlinePopupBorder = { fg = colors.peach },
						AlphaHeader = { bg = colors.cyan },
						NotifyBackground = { bg = colors.base },
						CursorLineNr = { fg = colors.green, bold = true },
						CursorLine = { bg = colors.trans },
						AvanteToBeDelete = { bg = colors.red, fg = colors.cyan },
						TreesitterContext = { fg = colors.crust },
						TreesitterContextLineNumber = { fg = colors.surface2, underline = false },
						TreesitterContextLineNumberBottom = { underline = false, undercurl = false },
						MiniIndentscopeSymbol = { fg = colors.surface2 }, -- ligne d'indentation mini.indentscope
						LineNr = { fg = colors.surface2 }, -- gutter line numbers
						IblScope = { fg = colors.surface2 },
						Operator = { fg = colors.yellow },
						Comment = { fg = colors.surface1 },
						AvanteSuggestion = { bg = colors.surface2 },
						AvantePopupHint = { fg = colors.green },
						AvanteToBeDeleted = { bg = colors.red, fg = colors.trans },
						AvanteSidebarWinSeparator = { fg = colors.cyan },
						AvanteTitle = { bg = colors.cyan },

						-- StatusLine
						MiniStatuslineModeNormal = { bg = colors.cyan },
						MiniStatuslineModeInsert = { bg = colors.yellow },

						-- General
						["@property"] = { fg = colors.text },
						["@tag.delimiter.svelte"] = { fg = colors.surface2 },
						["@custom.html"] = { fg = colors.base },
						["@punctuation.bracket"] = { fg = colors.surface2 },
						["@keyword.exception"] = { fg = colors.red },
						["@keyword.coroutine"] = { fg = colors.cyan, italic = true },
						["@keyword.import"] = { fg = colors.yellowdark, italic = true },
						["@keyword.export"] = { fg = colors.yellowdark, italic = true },
						["@keyword.return"] = { fg = colors.cyandarker, italic = true },
						["@string"] = { fg = colors.rosewater },

						-- Svelte
						["@tag.svelte"] = { fg = colors.maroon },
						["@component.svelte"] = { fg = colors.svelte, bold = true },
						["@label.typescript"] = { fg = colors.svelte, bold = true },
						["@keyword.svelte"] = { fg = colors.svelte, italic = true },
						["@tag.attribute.svelte"] = { fg = colors.green, italic = false },
						["@keyword.repeat.svelte"] = { fg = colors.svelte, bold = true, italic = true },
						["@keyword.conditional.svelte"] = { fg = colors.svelte, bold = true, italic = true },
						["@tag.component.svelte"] = { fg = colors.svelte, bold = true },
						["@class.component.svelte"] = { bold = true },
						["@lsp.type.function.svelte"] = { fg = colors.svelte },
						["@lsp.typemod.function.local.svelte"] = { fg = colors.blue },
						["@lsp.typemod.function.readonly.svelte"] = { fg = colors.sapphire },

						-- JS
						["@function.method.call.javascript"] = { bold = true },
						["@fetch.typescript"] = { fg = colors.cyan },

						-- TS
						["@keyword.typescript"] = { fg = colors.tsdarker },
						["@punctuation.special.typescript"] = { fg = colors.yellow },
						["@punctuation.delimiter.typescript"] = { fg = colors.surface2 },
						["@keyword.type.typescript"] = { fg = colors.tsblue },
						["@keyword.conditional.typescript"] = { fg = colors.lavender, italic = true },
						["@keyword.operator.typescript"] = { fg = colors.tsdarker, italic = true },
						["@lsp.type.type.svelte"] = { fg = colors.tsblue, underline = true },
						["@lsp.type.type.typescript"] = { fg = colors.tsblue, underline = true },
						["@type.builtin.typescript"] = { fg = colors.tsblue },
						["@lsp.type.interface"] = { fg = colors.tsblue, underline = true },
						["@lsp.typemod.interface.declaration.svelte"] = { fg = colors.tsblue },

						-- CSS
						["@property.class.scss"] = { fg = colors.blue },
						["@keyword.directive.scss"] = { fg = colors.rosedarker },
						["@variable.scss"] = { fg = colors.lavender },
						["@character.special.scss"] = { fg = colors.yellow },

						-- Diag
						DiagnosticWarn = { fg = colors.yellowdark },
						DiagnosticVirtualTextWarn = { fg = colors.yellowdark },
						DiagnosticUnderlineWarn = { sp = colors.yellowdark, undercurl = true },
						DiagnosticError = { fg = colors.reddarker },
						DiagnosticSignError = { fg = colors.reddarker },
					}
				end,
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
