local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-Down>", -- binding to scroll down inside the popup
		scroll_up = "<c-Up>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	-- ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
	["e"] = { "<cmd>NvimTreeToggle<cr>", "NvimTree" },
	["w"] = { "<cmd>w!<CR>", "Save" },
	["q"] = { "<cmd>q<CR>", "Quit" },
	["Q"] = { "<cmd>wq!<CR>", "Save & Quit" },
	["x"] = { "<cmd>bdelete!<CR>", "Close Buffer" },
	["<F5>"] = { "<cmd>set local spell!<CR>", "Set Spelling" },
	["<F6>"] = { "<cmd>nohlsearch<CR>", "No Highlight" },

	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		r = { "<cmd>PackerClean<cr>", "Remove Unused Plugins" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},

	f = {
		name = "FIND",
		f = { "<cmd>Telescope find_files<cr>", " Find Local Files" },
		b = { "<cmd>Telescope buffers<cr>", " Find Buffers" },
		e = { "<cmd>Telescope find_files cwd=~/.config/nvim<cr>", " Find Nvim Config Files" },
		o = { "<cmd>Telescope oldfiles<cr>", " Find Recent Files" },
		g = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", " Grep Current Buffer" },
		r = { "<cmd>Telescope registers<cr>", " Find Registers" },
		j = { "<cmd>Telescope jumplist<cr>", " Find JumpList" },
		s = { "<cmd>Telescope spell_suggest<cr>", " Find Spelling" },
		m = { "<cmd>Telescope marks<cr>", " Find Marks" },
		T = { "<cmd>Telescope tags<cr>", " Find Tags" },
		t = { "<cmd>Telescope current_buffer_tags<cr>", " Find Local Tags" },
		G = { "<cmd>Telescope grep_string<cr>", " Grep Directory" },
		p = { "<cmd>Telescope projects<cr>", " Find Projects" },
	},

	G = {
		name = "Git",
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		S = { "<cmd>lua require 'gitsigns'.stage_buffer()<cr>", "Stage Buffer" },
		u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
		U = { "<cmd>lua require 'gitsigns'.reset_buffer_index()<cr>", "Reset Buffer Index" },
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
	},

	l = {
		name = "LSP",
		D = { "<cmd>Telescope diagnostics<cr>", "Show Buffer Diagnostics" },
		d = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Show Line Diagnostics" },
		c = { "<cmd>Lspsaga show_cursor_diagnostics<cr>", "Show Cursor Diagnostics" },
		-- D = { "<cmd>lua vim.lsp.buf.declaration<cr>", "Declaration" },
		I = { "<cmd>NullLsInfo<cr>", "NullLs Info" },
		-- N = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
		W = { "<cmd>lua vim.lsp.buf.remove_workspace_folder<cr>", "Remove Workspace Folder" },
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		-- d = { "<cmd>lua vim.lsp.buf.definition<cr>", "Definition" },
		f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
		h = { "<cmd>Lspsaga lsp_finder<cr>", "Finder Help" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		-- n = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic" },
		q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
		-- r = { "<cmd>lua vim.lsp.buf.references()<cr>", "Reference" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		w = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "Add Workspace Folder" },
	},
	d = {
		name = "DAP",
		b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
		c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
		d = { "<cmd>Trouble document_diagnostics<cr>", " Document Diagnostics" },
		w = { "<cmd>Trouble workspace_diagnostics<cr>", " Workspace Diagnostics" },
		i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
		o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
		q = { "<cmd>Trouble quickfix<cr>", "Quickfix" },
		O = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
		r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
		l = { "<cmd>lua require'dap'.run_last()<cr>", "Run Last" },
		u = { "<cmd>lua require'dap'.dapui.toggle()<cr>", "Toggle DapUI" },
		t = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
		x = { "<cmd>Trouble<cr>", "Trouble" },
	},
	j = {
		name = "Jaq",
		j = { "<cmd>Jaq<cr>", "Run Code in Float" },
		b = { "<cmd>Jaq bang<cr>", "Run Code in StatusLine" },
		i = { "<cmd>Jaq internal<cr>", "Run Code in Internal" },
		t = { "<cmd>Jaq terminal<cr>", "Run Code in Terminal" },
		q = { "<cmd>Jaq quickfix<cr>", "Run Code in QF" },
	},
	a = {
		name = "CHANGE",
		c = { "<cmd>Telescope colorscheme<cr>", " Find Colorscheme" },
		C = { "<cmd>ColorizerToggle<cr>", " Toggle Colorizer" },
		r = { "<cmd>Telescope resume<cr>", "Resume Last Search" },
		b = { "<cmd>Telescope builtin<cr>", "Search Builtin Telescope " },
		g = { "<cmd>Glow %<cr>", " Glow Markdown Preview" },
		l = { "<cmd>LuaSnipListAvailable<cr>", " Find Snippets" },
		m = { "<cmd>lua require'telescope'.extensions.media_files.media_files()<cr>", " Find Media Files" },
		t = { "<cmd>Telescope treesitter<cr>", " Find Treesitter Functions" },
		p = { "<cmd>TSPlaygroundToggle<cr>", " Playground" },
		h = { "<cmd>TSHighlightCapturesUnderCursor<cr>", " Highlight Under Cursor" },
	},
	r = {
		name = "Navigator",
		k = { "<cmd>LspKeymaps<cr>", "Lsp Key Maps" },
		c = { "<cmd>Calltree<cr>", "Calltree Hierarchy" },
		s = { "<cmd>LspSymbols<cr>", "Lsp Symbols" },
		t = { "<cmd>Nctags<cr>", "Lsp Tags" },
		r = { "<cmd>LspRestart<cr>", "Lsp Restart" },
		f = { "<cmd>LspToggleFmt<cr>", "Toggle Format" },
		T = { "<cmd>TSymbols<cr>", "TS Symbols" },
	},
	s = {
		name = "Search",
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		d = { "<cmd>Telescope diagnostics<cr>", "Find Errors" },
		m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		v = { "<cmd>Telescope vim_options<cr>", " Find Vim Options" },
		f = { "<cmd>lua require'telescope'.extensions.frecency.frecency()<cr>", " Find Frequent Files" },
		n = { "<cmd>Telescope notify<cr>", " Search Notifications" },
		S = { "<cmd>Telescope search_history<cr>", " Search Search History" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		c = { "<cmd>Telescope commands<cr>", "Commands" },
		H = { "<cmd>Telescope command_history<cr>", " Find Command History" },
	},
	t = {
		name = "Terminal",
		n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
		l = { "<cmd>lua _LUA_TOGGLE()<cr>", "LUA" },
		b = { "<cmd>lua _BTOP_TOGGLE()<cr>", "Btop" },
		p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
		f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
		h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
		v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
	},
	z = {
		name = "ZEN",
		z = { "<cmd>ZenMode<cr>", "Zen Mode" },
		t = { "<cmd>Twilight<cr>", "Twilight Mode" },
	},
}

which_key.setup(setup)
which_key.register(mappings, opts)
