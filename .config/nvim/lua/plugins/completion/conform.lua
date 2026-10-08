return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_format", "ruff_organize_imports" },
				rust = { "rustfmt" },
				quarto = { "injected" },
			},
			format_on_save = { lsp_format = "fallback" },
			undojoin = true,

			formatters = {
				injected = {
					options = {
						ignore_errors = false,
						-- map of treesitter language to file extension
						-- a temporary file name with this extension will be generated during formatting
						-- because some formatters care about the filename.
						lang_to_ext = {
							bash = "sh",
							latex = "tex",
							markdown = "md",
							python = "py",
							rust = "rs",
							r = "r",
						},
						-- map of treesitter language to formatters to use
						-- (defaults to the value from formatters_by_ft)
						lang_to_formatters = {},
					},
				},
			},
		},
		keys = {
			{
				"<leader>cf",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = { "n", "v" },
				desc = "Format buffer",
			},
		},
	},
}
