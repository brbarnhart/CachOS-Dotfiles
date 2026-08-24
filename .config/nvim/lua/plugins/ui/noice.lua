return {
	{
		"rcarriga/nvim-notify",
		lazy = false,
		opts = {
			background_colour = "#000000",
			render = "compact",
			stages = "slide",
		},
		config = function(_, opts)
			require("notify").setup(opts)
			vim.notify = require("notify")
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		opts = {
			messages = {
				enabled = true,
				view = "mini",
				view_error = "notify", -- view for errors
				view_warn = "notify", -- view for warnings
				view_history = "messages", -- view for :messages
				view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
			},
			notify = {
				enabled = true,
				view = "notify",
			},
			hover = {
				enabled = false,
			},
			lsp = {
				hover = {
					enabled = false,
				},
				signature = {
					enabled = false,
				},
			},
			presets = {
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
		},
	},
}
