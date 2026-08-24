-- Only show diagnostics close to the cursor
vim.diagnostic.config({
	virtual_text = {
		spacing = 4,
		prefix = function(diagnostic)
			local icons = {
				[vim.diagnostic.severity.ERROR] = " ",
				[vim.diagnostic.severity.WARN] = "󰉀 ",
				[vim.diagnostic.severity.INFO] = " ",
				[vim.diagnostic.severity.HINT] = "󰌵 ",
			}
			return icons[diagnostic.severity] or ""
		end,
	},
	signs = false,
	underline = true,
	update_in_insert = false,
})
