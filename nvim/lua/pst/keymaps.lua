-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)
keymap("n", "<Down>", "gj", opts)
keymap("n", "<Up>", "gk", opts)
keymap("i", "<Down>", "<C-o>gj", opts)
keymap("i", "<Up>", "<C-o>gk", opts)
-- Centre Focus on middle screen
keymap("n", "G", "Gzz", opts)
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "}", "}zz", opts)
keymap("n", "{", "{zz", opts)
-- Move selected text
keymap("x", "J", ":m '>+1<CR>gv=gv", { desc = "Join line below to current line" }, opts)
keymap("x", "K", ":m '<-2<CR>gv=gv", opts)
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
-- Resize with arrows
keymap("n", "<C-Up>", ":resize -3<CR>", { desc = "Resize Up" }, opts)
keymap("n", "<C-Down>", ":resize +3<CR>", { desc = "Resize Down" }, opts)
keymap("n", "<C-Left>", ":vertical resize -3<CR>", { desc = "Resize Left" }, opts)
keymap("n", "<C-Right>", ":vertical resize +3<CR>", { desc = "Resize Right" }, opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", { desc = "Next Buffer" }, opts)
keymap("n", "<S-h>", ":bprevious<CR>", { desc = "Previous Buffer" }, opts)

-- Clear highlights
keymap("n", "<F6>", "<cmd>nohlsearch<CR>", { desc = "Toggle Search Highlight" }, opts)

-- Set spell
keymap("n", "<F5>", "<cmd>setlocal spell!<CR>", { desc = "Toggle SpellCheck." }, opts)

-- Close buffers
keymap("n", "<leader>x", "<cmd>bdelete!<CR>", { desc = "Close the buffer you are in." }, opts)

-- Save File
keymap("n", "<leader>w", "<cmd>write!<CR>", { desc = "Save the File" }, opts)

-- Close Nvim
keymap("n", "<leader>q", "<cmd>quit<CR>", { desc = "Exit Neovim" }, opts)
keymap("n", "<leader>Q", "<cmd>quit!<CR>", { desc = "Exit Neovim WITHOUT Saving" }, opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Select All
keymap("n", "<C-a>", "gg<S-v>G", { desc = "Select All" })

--No register for x
-- keymap("n", "x", '"_x')

--Increment/Decrament
keymap("n", "+", "<C-a>", { desc = "Increment a Number" })
keymap("n", "-", "<C-x>", { desc = "Decrament a Number" })

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "NvimTree Toggle" }, opts)

-- Telescope
-- keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
-- keymap("n", "<leader>fg", ":Telescope current_buffer_fuzzy_find<CR>", opts)
-- keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
-- keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
-- keymap("n", "<leader>rf", ":LspToggleFmt<CR>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { desc = "LazyGit" }, opts)

keymap("i", "<C-s>", "<cmd>Telescope symbols<cr>", { desc = "Insert symbols / Emojies" }, opts)
keymap("n", "<C-s>", "<cmd>Telescope symbols<cr>", { desc = "Insert symbols / Emojies" }, opts)

-- Comment
keymap(
	"n",
	"<leader>c",
	"<cmd>lua require('Comment.api').toggle.linewise.current()<CR>",
	{ desc = "Comment out line" },
	opts
)
keymap(
	"x",
	"<leader>c",
	'<ESC><CMD>lua require("Comment.api").toggle.linewise.op(vim.fn.visualmode())<CR>',
	{ desc = "Comment out Visual Selection" },
	opts
)
keymap("n", "<leader>?", "<cmd>Cheatsheet<CR>", { desc = "Cheatsheet for Commands" }, opts)
-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { desc = "Dap-BreakPoint" }, opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", { desc = "Dap-Continue" }, opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", { desc = "Dap-Step-Into" }, opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", { desc = "Dap-Step-Over" }, opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", { desc = "Dap-Step-Out" }, opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", { desc = "Dap-Repl" }, opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", { desc = "Dap-Run-Last" }, opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", { desc = "Dap-Toggle" }, opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", { desc = "Dap-Terminate" }, opts)

keymap("i", "<C-Up>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-4)<cr>", opts)
keymap("i", "<C-Down>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(4)<cr>", opts)
-- Setup keymaps for Hover
keymap("n", "K", "<cmd>lua require('hover').hover()<cr>", { desc = "hover.nvim" }, opts)
keymap("n", "gK", "<cmd>lua require('hover').hover_select()<cr>", { desc = "hover.nvim (select)" }, opts)
