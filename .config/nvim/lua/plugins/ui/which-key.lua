return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "classic",
			delay = 300,
			icons = {
				mappings = true, -- mini.icons when available
			},
			win = {
				border = "rounded",
				wo = {
					-- Soft blend so the popup doesn't paint a solid mantle over the terminal
					winblend = 10,
				},
			},
			triggers = {
				{ "<auto>", mode = "nxso" },
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)

			-- Group labels for existing leader prefixes (individual maps use Keymap `desc`)
			wk.add({
				{ "<leader>f", group = "find" },
				{ "<leader>t", group = "terminal" },
				{ "<leader>q", group = "quit/session" },
				{ "<leader>b", group = "buffer" },
				{ "<C-t>", group = "tabs" },
			})
		end,
	},
}
