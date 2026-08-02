vim.pack.add({
	{ src = "https://github.com/quarto-dev/quarto-nvim.git", name = "quarto-nvim" },
	{ src = "https://github.com/jmbuhr/otter.nvim.git", name = "otter-nvim" },
})

require("quarto").setup()
