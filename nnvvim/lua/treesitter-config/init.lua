vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	virtual_text = { spacing = 5, severity_limit = "Warning" },
	update_in_insert = true,
})
require("nvim-treesitter.configs").setup({
	ensure_installed = { "html", "css", "javascript", "bash", "lua", "python", "vim" },
	highlight = {
		enable = true, -- false will disable the whole extension
		additional_vim_regex_highlighting = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			scope_incremental = "<CR>",
			node_incremental = "<TAB>",
			node_decremental = "<S-TAB>",
		},
	},
	indent = { enable = true },
	matchup = { enable = true },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	playground = {
		enable = true,
		disable = {},
		updatetime = 25,
		persist_queries = false,
		keybindings = {
			toggle_query_editor = "o",
			toggle_hl_groups = "i",
			toggle_injected_languages = "t",
			toggle_anonymous_nodes = "a",
			toggle_language_display = "I",
			focus_language = "f",
			unfocus_language = "F",
			update = "R",
			goto_node = "<CR>",
			show_help = "?",
		},
		query_linter = {
			enable = true,
			use_virtual_text = true,
			lint_events = { "BufWrite", "CursorHold" },
		},
	},
	autotag = { enable = true },
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
	autopairs = { enable = true },
	refactor = {
		smart_rename = { enable = true, keymaps = { smart_rename = "grr" } },
		-- highlight_current_scope = {enable = true},
		highlight_definitions = { enable = true, clear_on_cursor_move = true },
		navigation = {
			enable = true,
			keymaps = {
				-- can use telescope for these lists
				goto_definition_lsp_fallback = "gnd",
				list_definitions = "gnD",
				list_definitions_toc = "gO",
				-- @TODOUA: figure out if I need both below
				goto_next_usage = "<a-*>", -- is this redundant?
				goto_previous_usage = "<a-#>", -- also this one?
			},
		},
	},
	textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@call.outer",
        ["ic"] = "@call.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@call.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@call.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@call.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@call.outer",
      },
    },
    swap = {
      enable = true,
      swap_next = {
        [",a"] = "@parameter.inner",
      },
      swap_previous = {
        [",A"] = "@parameter.inner",
      },
    },
		lsp_interop = {
			enable = true,
			border = "none",
			peek_definition_code = {
				["<leader>jp"] = "@function.outer",
				["<leader>jP"] = "@class.outer",
			},
		},
	},
})
