local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	print("Problems with TOGGLETERM-CONFIG")
end
toggleterm.setup({
	size = 13,
	open_mapping = [[<c-\>]],
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	close_on_exit = true,
	persist_size = true,
	direction = "float",
	float_opts = { border = "curved" },
})

-- local Terminal = require("toggleterm.terminal").Terminal
-- local toggle_float = function()
-- 	local float = Terminal:new({ direction = "float", hidden = true })
-- 	return float:toggle()
-- end
-- local toggle_lazygit = function()
-- 	local lazygit = Terminal:new({ cmd = "lazygit", direction = "float", hidden = true })
-- 	return lazygit:toggle()
-- end
-- local toggle_python = function()
-- 	local python = Terminal:new({ cmd = "python", direction = "float" })
-- 	return python:toggle()
-- end
-- local toggle_lua = function()
-- 	local lua = Terminal:new({ cmd = "lua", direction = "float" })
-- 	return lua:toggle()
-- end
-- local map = vim.keymap.set
-- local opts = { noremap = true, silent = true }
-- map( "n", "<leader>tt", ":ToggleTerm<cr>", opts )
