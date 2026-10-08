-- Keymap function
-- opts: optional string (used as desc) or table of vim.keymap.set options
function Keymap(mode, key, binding, opts)
	local options = { noremap = true, silent = true }
	if type(opts) == "string" then
		options.desc = opts
	elseif type(opts) == "table" then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, key, binding, options)
end

-- My navigation preferences
Keymap({ "v", "i" }, "jk", "<escape>", "Escape")
Keymap({ "v", "n" }, "H", "_", "Start of line (non-blank)")
Keymap({ "v", "n" }, "L", "$", "End of line")

Keymap("n", "q:", ":", "Command line (disable q:)")
Keymap("n", "<leader>bd", function()
	vim.cmd("bd")
	vim.cmd("echo 'Buffer deleted'")
end, "Delete buffer")

for _, bind in ipairs({ "i", "a", "A" }) do
	-- Pass { expr = true } as the fourth argument
	Keymap("n", bind, function()
		if vim.fn.getline("."):match("^%s*$") then
			return [["_cc]]
		else
			return bind
		end
	end, { expr = true })
end

Keymap("i", "<C-BS>", "<C-W>", "Delete word backward")

Keymap("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>", "Diagnostics")
Keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition")

-- Terminal Keymaps
Keymap("n", "<leader>tj", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.startinsert()
end, "Terminal (vsplit)")
Keymap("n", "<leader>tk", function()
	vim.cmd.tabnew()
	vim.cmd.term()
	vim.cmd.startinsert()
end, "Terminal (tab)")
Keymap("t", "<C-D>", "<C-\\><C-n>", "Exit terminal mode")

-- Mini Session Keybinds (mini.nvim is loaded eagerly)
Keymap("n", "<leader>qj", function()
	require("mini.sessions").write(".session")
	vim.cmd("wqa")
end, "Quit + write session")

Keymap("n", "<leader>qd", function()
	require("mini.sessions").delete(".session")
	vim.cmd("wqa")
end, "Quit + delete session")

Keymap("n", "<leader>fs", function()
	MiniSessions.select()
end, "Select session")

Keymap("n", "<leader>fd", function()
	MiniSessions.select("delete")
end, "Delete session")

-- Flash / Telescope keymaps live on their plugin specs so lazy can load them.

-- Tab binds
Keymap("n", "<C-T>l", function()
	vim.cmd("tabnext")
end, "Next tab")

Keymap("n", "<C-T>h", function()
	vim.cmd("tabprevious")
end, "Previous tab")

Keymap("n", "<C-T>j", function()
	vim.cmd("tabnew")
end, "New tab")

Keymap("n", "<C-T>q", function()
	vim.cmd("tabclose")
end, "Close tab")
