--require("vimwiki").setup({})
-- vim.g.vimwiki_list = " path = '~/Documents/vimwiki/', syntax = 'default'"

--vim.cmd{[[let g:vimwiki_list = [{'path': '~Documents/vimwiki/'}]]}
--
--local vim.g:map_prefix = "leader>n"
local map = vim.keymap.set
map("n", "<leader>nw", "<Plug>VimwikiIndex<CR>", { noremap = true, silent = true })
map("n", "<leader>nt", "<Plug>VimwikiTabIndex<CR>", { noremap = true, silent = true })
map("n", "<leader>ns", "<Plug>VimwikiUISelect<CR>", { noremap = true, silent = true })
map("n", "<leader>ni", "<Plug>VimwikiDiaryIndex<CR>", { noremap = true, silent = true })
map("n", "<leader>nh", "<Plug>Vimwiki2HTML<CR>", { noremap = true, silent = true })
map("n", "<leader>nH", "<Plug>Vimwiki2HTMLBrowse<CR>", { noremap = true, silent = true })
map("n", "<leader>nn", "<Plug>VimwikiGoto<CR>", { noremap = true, silent = true })
map("n", "<leader>nd", "<Plug>VimwikiDeleteFile<CR>", { noremap = true, silent = true })
map("n", "<leader>nr", "<Plug>VmwikiRenameFile<CR>", { noremap = true, silent = true })
map("n", "<leader>nT", "<Plug>VimwikiTable<CR>", { noremap = true, silent = true })
map("n", "<leader>nS", "<Plug>VimwikiSearchTags<CR>", { noremap = true, silent = true })
map("n", "<leader>nf", "<Plug>VimwikiSearch<CR>", { noremap = true, silent = true })
map("n", "<leader>ng", "<Plug>VimwikiGenerateLinks<CR>", { noremap = true, silent = true })
map("n", "<leader>nc", "<Plug>VimwikiTOC<CR>", { noremap = true, silent = true })
map("n", "<leader>n<leader>w", "<Plug>VimwikiMakeDiaryNote<CR>", { noremap = true, silent = true })
map("n", "<leader>n<leader>t", "<Plug>VimwikiTabMakeDiaryNote<CR>", { noremap = true, silent = true })
map("n", "<leader>n<leader>i", "<Plug>VimwikiDiaryGenerateLinks<CR>", { noremap = true, silent = true })
map("n", "<leader>n<leader>m", "<Plug>VimwikiMakeTomorrowDiaryNote<CR>", { noremap = true, silent = true })
map("n", "<leader>n<leader>y", "<Plug>VimwikiMakeYesterdayDiaryNote<CR>", { noremap = true, silent = true })
