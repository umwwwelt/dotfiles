return {
	{
		"goolord/alpha-nvim",
		config = function()
			local dashboard = require("alpha.themes.dashboard")

			dashboard.section.header.val = {
				"              ,-:;//;:=,",
				"          . :H@@@MM@M#H/.,+%;,",
				"       ,/X+ +M@@M@MM%=,-%HMMM@X/,",
				"     -+@MM; $M@@MH+-,;XMMMM@MMMM@+-",
				"    ;@M@@M- XM@X;. -+XXXXXHHH@M@M#@/.",
				"  ,%MM@@MH ,@%=             .---=-=:=,.",
				"  =@#@@@MX.,                -%HX$$%%%:;",
				" =-./@M@M$                   .;@MMMM@MM:",
				" X@/ -$MM/                    . +MM@@@M$",
				",@M@H: :@:                    . =X#@@@@-",
				",@@@MMX, .                    /H- ;@M@M=",
				".H@@@@M@+,                    %MM+..%#$.",
				" /MMMM@MMH/.                  XM@MH; =;",
				"  /%+%$XHH@$=              , .H@@@@MX,",
				"   .=--------.           -%H.,@@@@@MX,",
				"   .%MM@@@HHHXX$$$%+- .:$MMX =M@@MM%.",
				"     =XMMM@MM@MM#H;,-+HMM@M+ /MMMX=",
				"       =%@M@M#@$-.=$@MM@@@M; %M%=",
				"         ,:+$+-,/H#MMMMMMM@= =,",
				"               =++%%%%+/:-.",
			}

			-- Set menu
			dashboard.section.buttons.val = {
				dashboard.button("e", " | New file", ":ene <BAR> startinsert <CR>"),
				dashboard.button("f", "󰮗 | Find file", ":Telescope find_files<CR>"),
				dashboard.button("g", " | Find text", ":Telescope live_grep<CR>"),
				dashboard.button("r", " | Recent", ":Telescope oldfiles<CR>"),
				-- dashboard.button("s", " | Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
				dashboard.button("q", "󰗼 | Quit", ":qa<CR>"),
			}

			require("alpha").setup(dashboard.config)
		end,
	},
}
