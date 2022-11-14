local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	print("Problems with TELESCOPE-CONFIG")
end
local actions = require("telescope.actions")
telescope.setup({
	defaults = {
		layout_config = {
			width = 0.75,
			prompt_position = "top",
			preview_cutoff = 120,
			horizontal = { mirror = false },
			vertical = { mirror = false },
		},
		find_command = { "rg", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
		prompt_prefix = " ",
		selection_caret = " ",
		entry_prefix = "  ",
		initial_mode = "insert",
		-- theme = "ivy", -- ivy, dropdown,cursor
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "flex",
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		file_ignore_patterns = {},
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		path_display = {},
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
		mappings = {
			i = {
				["<Tab>"] = actions.toggle_selection + actions.move_selection_next,
				["<S-Tab>"] = actions.move_selection_previous,
				["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
				["<esc>"] = actions.close,
				["<CR>"] = actions.select_default + actions.center,
			},
			n = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
			},
		},
	},
	load_extension = { "fzf", "dap", "luasnip", "projects", "symbols", "cheat", "frecency", "packer", "media_files" },
	extensions = {
		"fzf",
		"dap",
		"packer",
		"symbols",
		"luasnip",
		"media_files",
		"project",
		"frecency",
		"cheat",
	},
})

-- require("telescope").extensions.luasnip.luasnip({})

-- vim.keymap.set(
-- 	"n",
-- 	"<leader>fp",
-- 	"lua require'telescope'.extensions.project.project{}<CR>",
-- 	{ noremap = true, silent = true }
-- )
--
