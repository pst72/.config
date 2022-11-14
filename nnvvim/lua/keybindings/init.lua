vim.g.mapleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local nopts = { silent = true }
local term_opts = { silent = true }
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
-- map("n", "<space>", "<NOP>", opts)

map("n", "<Tab>", ":bnext<CR>", opts)
map("n", "<S-Tab>", ":bprevious<CR>", opts)

map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
map("v", "<leader>c", ":CommentToggle<CR>", opts)
-- Indentation
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

map("n", "<C-Left>", ":vertical resize +3<CR>", opts)
map("n", "<C-Right>", ":vertical resize -3<CR>", opts)
map("n", "<C-Up>", ":resize -3<CR>", opts)
map("n", "<C-Down>", ":resize +3<CR>", opts)

map("n", "j", "gj", opts)
map("n", "k", "gk", opts)
map("n", "<Down>", "gj", opts)
map("n", "<Up>", "gk", opts)
map("i", "<Down>", "<C-o>gj", opts)
map("i", "<Up>", "<C-o>gk", opts)
-- Centre Focus on middle screen
map("n", "G", "Gzz", opts)
map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)
map("n", "}", "}zz", opts)
map("n", "{", "{zz", opts)
-- Move selected text
map("x", "J", ":m '>+1<CR>gv=gv", opts)
map("x", "K", ":m '<-2<CR>gv=gv", opts)
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

map("n", "<F5>", ":setlocal spell!<CR>", opts)
map("n", "<F6>", ":noh<CR>", opts)
map("n", "cd", ":cd %:p:h<CR>", opts)
map("n", "Y", "y$", opts)
map("v", "p", '"_dp', opts)

map("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
map("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
map("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
map("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
--map('i', '<C-U>', '<Esc>viwUea', opts)
--map('n', '<C-U>', 'viwu<Esc>', opts)
--map('i', '<C-u>', '<Esc>viwuea', opts)
-- map("n", "<C-u>", "viwu<Esc>", opts)

map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)
map("n", "<leader>ac", "<cmd>Telescope colorscheme<CR>", opts)
map("n", "<leader>fr", "<cmd>Telescope registers<CR>", opts)
map("n", "<leader>fl", "<cmd>Telescope current_buffer_fuzzy_find<CR>", opts)
map("n", "<leader>af", "<cmd>lua require'telescope'.extensions.frecency.frecency()<CR>", opts)

map("n", "<leader>nw", "<Plug>VimwikiIndex<CR>", nopts)

-- map("i", "<C-k>", ":<Plug>fzf-dictionary-open<CR>", nopts)
map("n", "<C-Up>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-4)<cr>", opts)
map("n", "<C-Down>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(4)<cr>", opts)
