return {
	{
		"mason-org/mason.nvim",
		lazy = false,
		opts = {
			ui = {
				border = "rounded",
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						-- Tell the server to let Neovim handle snippet expansion
						completion = {
							callSnippet = "Replace",
						},
						-- Use LuaJIT (which Neovim uses)
						runtime = {
							version = "LuaJIT",
						},
					},
				},
			})

			vim.lsp.enable({
				"lua_ls",
				"pylsp",
				"nixd",
				"rust_analyzer",
				"panache",
			})

			vim.o.pumborder = "rounded"
		end,
	},

	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},

	{
		"saghen/blink.cmp",
		version = "*", -- or a tag; blink often wants a build/release binary
		dependencies = {
			"saghen/blink.lib",
			"folke/lazydev.nvim",
		},
		event = "InsertEnter",
		opts = {
			signature = { enabled = false },
			completion = {
				trigger = {
					show_on_insert = true,
					show_on_trigger_character = true,
					show_on_keyword = true,
					show_on_backspace = true,
				},
				list = {
					selection = {
						preselect = false,
						auto_insert = true,
					},
				},
				menu = {
					auto_show = true,
					border = "rounded",
					min_width = 35,
					auto_show_delay_ms = 100,
				},
			},
			keymap = {
				["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
			},
			sources = {
				default = { "lazydev", "lsp", "path", "snippets", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},
		},
	},

	{
		"folke/lazydev.nvim",
		ft = "lua",
	},
}
