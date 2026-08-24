return {
	{
		"echasnovski/mini.nvim",
		lazy = false,
		config = function()
			require("mini.pairs").setup() -- Bracket pairs and stuff

			require("mini.ai").setup() -- Around and In extension for visual mode

			require("mini.indentscope").setup({ -- shows indents
				symbol = "│",
				draw = {
					delay = 10,
					animation = require("mini.indentscope").gen_animation.linear({
						duration = 15,
						unit = "step",
						easing = "out",
					}),
				},
			})

			require("mini.trailspace").setup() -- Shows useless spaces

			require("mini.surround").setup() -- Surround selections with characters

			require("mini.move").setup({ -- move selection in visual mode
				mappings = {
					down = "J",
					up = "K",
				},
			})

			require("mini.icons").setup() -- Icon provider

			-- Used by session keymaps in config/keymaps.lua
			require("mini.sessions").setup()
		end,
	},
}
