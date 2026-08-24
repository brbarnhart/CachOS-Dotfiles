return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"neovim-treesitter/treesitter-parser-registry",
		},
		lazy = false,
		build = ":TSUpdate",

		config = function()
			require("nvim-treesitter").install({
				"bash",
				"html",
				"latex",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"query",
				"regex",
				"rust",
				"python",
				"vim",
				"yaml",
			})

			-- Enable highlighting + indentation
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"bash",
					"html",
					"latex",
					"json",
					"lua",
					"markdown",
					"markdown_inline",
					"query",
					"regex",
					"rust",
					"python",
					"vim",
					"yaml",
				},
				callback = function()
					vim.treesitter.start()
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					-- Optional: treesitter-based folds
					-- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
					-- vim.wo.foldmethod = "expr"
				end,
			})
		end,
	},
}
