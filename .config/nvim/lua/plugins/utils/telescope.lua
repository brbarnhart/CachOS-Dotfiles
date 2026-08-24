return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-symbols.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
			"nvim-telescope/telescope-file-browser.nvim",
			"2kabhishek/nerdy.nvim",
		},
		keys = {
			{
				"<leader>ff",
				function()
					require("telescope.builtin").find_files({ hidden = true })
				end,
				desc = "Find files",
			},
			{
				"<leader>fn",
				function()
					local full_path = vim.api.nvim_buf_get_name(0)
					local dir = vim.fn.fnamemodify(full_path, ":h")
					require("telescope").extensions.file_browser.file_browser({
						path = dir,
					})
				end,
				desc = "File browser (buffer dir)",
			},
			{
				"<leader>fg",
				function()
					require("telescope.builtin").live_grep({ hidden = true })
				end,
				desc = "Live grep",
			},
			{
				"<leader>fb",
				function()
					require("telescope.builtin").buffers({ show_all_buffers = true })
				end,
				desc = "Buffers",
			},
		},
		config = function()
			local actions = require("telescope.actions")
			require("telescope").setup({
				defaults = {
					file_ignore_patterns = {
						".git",
						"%.csv",
						".venv",
						".node_modules",
						"node_modules",
						".svelte-kit",
						".vscode",
					},
				},
				pickers = {
					buffers = {
						show_all_buffers = true,
						mappings = {
							i = {
								["<CR>"] = actions.select_drop,
							},
							n = {
								["<CR>"] = actions.select_drop,
								["d"] = actions.delete_buffer,
							},
						},
					},
					find_files = {
						show_all_buffers = true,
						mappings = {
							i = {
								["<CR>"] = actions.select_drop,
							},
							n = {
								["<CR>"] = actions.select_drop,
							},
						},
					},
					live_grep = {
						additional_args = function()
							return { "--hidden" }
						end,
					},
				},
				extensions = {
					file_browser = {
						theme = "ivy",
						hijack_netrw = true,
					},
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			require("telescope").load_extension("file_browser")
			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("nerdy")
		end,
	},
}
