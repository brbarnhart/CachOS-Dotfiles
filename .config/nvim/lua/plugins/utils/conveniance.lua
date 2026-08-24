-- Small quality-of-life plugins (not UI chrome).
-- Noice lives in plugins/ui/noice.lua — do not re-add it here.

return {
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			modes = {
				search = { enabled = false },
			},
		},
		keys = {
			{
				"ss",
				mode = "n",
				function()
					require("flash").jump()
				end,
				desc = "Flash jump",
			},
			{
				"S",
				mode = "n",
				function()
					require("flash").treesitter()
				end,
				desc = "Flash treesitter",
			},
			{
				"<leader>r",
				mode = "n",
				function()
					require("flash").remote()
				end,
				desc = "Flash remote",
			},
			{
				"<leader>R",
				mode = "n",
				function()
					require("flash").treesitter_search()
				end,
				desc = "Flash treesitter search",
			},
		},
	},
}
