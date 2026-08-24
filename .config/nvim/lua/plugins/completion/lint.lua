return {
	{
		"mfussenegger/nvim-lint",
		event = { "BufWritePost", "BufReadPost", "InsertLeave" },
		config = function()
			local lint = require("lint")
			-- lint.linters_by_ft = { python = { 'ruff' }, ... }

			-- Auto-run the linter only for the configured filetypes
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					if lint.linters_by_ft[vim.bo.filetype] then
						lint.try_lint()
					end
				end,
			})
		end,
	},
}
