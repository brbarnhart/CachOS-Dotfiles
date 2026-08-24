return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = false,
		opts = {
			transparent_background = true, -- disables setting the background color.
			float = {
				transparent = true, -- enable transparent floating windows
				solid = false, -- use solid styling for floating windows, see |winborder|
			},
			show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
			integrations = {
				which_key = true,
			},
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
	{
		"tadaa/vimade",
		event = "VeryLazy",
		opts = {
			recipe = { "minimalist", { animate = true } },
			fadelevel = 0.6,
		},
	},
}
