--COMMANDS - AUTOFUNCTIONS
vim.cmd("filetype plugin indent on")
vim.cmd([[autocmd TextYankPost * lua vim.highlight.on_yank {on_visual = true}]])
vim.cmd([[
    augroup remember-cursor-position
        autocmd!
        autocmd BufReadPost * if line ("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
     augroup END
    ]])
vim.api.nvim_exec(
	[[
  au CursorHoldI * stopinsert
  au InsertEnter * let updaterestore=&updatetime | set updatetime=15000
  au InsertLeave * let &updatetime=updaterestore
]],
	false
)
vim.api.nvim_exec(
	[[
  augroup SetMarkdownFt
    autocmd!
    autocmd BufFilePre,BufRead,BufNewFile *.md,*.MD,*.mdwn,*.mkdn,*.mkd,*.mdown,*.markdown set ft=markdown
  augroup END
]],
	false
)
vim.cmd([[autocmd Filetype qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>]])
vim.cmd([[autocmd Filetype qf set nobuflisted]])

-- OPTIONS SETTINGS
vim.o.hidden = true
vim.o.termguicolors = true
vim.opt.termguicolors = true
vim.o.title = false
vim.o.showmode = true
vim.o.showmatch = true
vim.o.showcmd = true
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.whichwrap = "b,s,<,>,[,],h,l"
vim.o.pumheight = 15
vim.o.fileencoding = "utf-8"
vim.o.cmdheight = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.conceallevel = 0
vim.o.showtabline = 2
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.updatetime = 300
vim.o.timeoutlen = 200
vim.o.clipboard = "unnamedplus"
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.infercase = true
vim.o.scrolloff = 100
vim.o.sidescrolloff = 3
vim.o.mouse = "a"
vim.o.wrap = true
vim.o.cursorline = true
vim.o.statusline = " %<%F%r%m%=%=%=%=%=[buf %n]  %y%=          %=%=%=%w    %3l/%L%=%P "
vim.wo.signcolumn = "yes"
vim.o.colorcolumn = "80"
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
vim.bo.smartindent = true
vim.o.expandtab = true
vim.o.spell = false
vim.bo.expandtab = true
vim.o.smarttab = true
vim.o.undofile = true
vim.o.undodir = "/home/pi72/.config/nvim/undodir"
vim.o.wildmenu = true
vim.o.wildignore = "*/node_modules/*,*/.gitignore"
-- vim.wo.wildcharm = '<Tab>'
vim.o.wildmode = "longest:full:lastused"
vim.o.wildoptions = "pum"
vim.o.nrformats = "bin,hex,alpha"
vim.o.autochdir = true
vim.o.number = true
vim.o.relativenumber = true
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")
vim.opt.dictionary:append("/usr/share/dict/words")
vim.opt.laststatus = 3
vim.opt.completeopt = "menu,menuone,noselect,noinsert"
