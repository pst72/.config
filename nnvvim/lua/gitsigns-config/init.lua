local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
	print("Problems with GITSIGNS-CONFIG")
end
gitsigns.setup({
	signs = {
		add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
		delete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		topdelete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		changedelete = {
			hl = "GitSignsChange",
			text = "▎",
			numhl = "GitSignsChangeNr",
			linehl = "GitSignsChangeLn",
		},
	},
  signcolumn = true,
	numhl = true,
	linehl = false,
	preview_config = { border = "rounded" },
	keymaps = { noremap = true, buffer = true },
	watch_gitdir = { interval = 1000, follow_files = true },
	sign_priority = 6,
	update_debounce = 200,
	status_formatter = nil,
	current_line_blame = false,
})

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map("n", "<leader>Gs", "<cmd>Gitsigns stage_hunk<CR>", opts)
map("v", "<leader>Gs", ":Gitsigns stage_hunk<CR>", opts)
map("n", "<leader>Gu", "<cmd>Gitsigns undo_stage_hunk<CR>", opts)
map("n", "<leader>Gr", "<cmd>Gitsigns reset_hunk<CR>", opts)
map("v", "<leader>Gr", ":Gitsigns reset_hunk<CR>", opts)
map("n", "<leader>GR", "<cmd>Gitsigns reset_buffer<CR>", opts)
map("v", "<leader>Gp", ":Gitsigns preview_hunk<CR>", opts)
map("n", "<leader>Gp", "<cmd>Gitsigns preview_hunk<CR>", opts)
map("n", "<leader>Gb", "<cmd>lua require'gitsigns'.blame_line{full=true}<CR>", opts)
map("n", "<leader>GS", "<cmd>Gitsigns stage_buffer<CR>", opts)
map("n", "<leader>GU", "<cmd>Gitsigns reset_buffer_index<CR>", opts)
