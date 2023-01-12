-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
local actions = require("telescope.actions")
require("telescope").setup({
	defaults = {
		prompt_prefix = " ",
		selection_caret = "👉 ",
		path_display = { "smart" },
		-- sorting_strategy = "ascending",
		layout_strategy = "flex",
		mappings = {
			i = {
				["<C-j>"] = actions.cycle_history_next,
				["<C-k"] = actions.cycle_history_prev,
				["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["<C-Up>"] = actions.preview_scrolling_up,
				["<C-Down>"] = actions.preview_scrolling_down,
			},
			n = {
				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["<C-Up>"] = actions.preview_scrolling_up,
				["<C-Down>"] = actions.preview_scrolling_down,
				["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
			},
		},
		load_extension = {
			"fzf",
			"dap",
			"luasnip",
			-- "projects",
			"symbols",
			"notify",
			"noice",
			"cheat",
			"frecency",
			"packer",
			"media_files",
		},
		extensions = {
			"fzf",
			"dap",
			"noice",
			"packer",
			"notify",
			"symbols",
			"luasnip",
			"media_files",
			"projects",
			"frecency",
			"cheat",
		},
	},
})

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "projects")
pcall(require("telescope").load_extension, "noice")
pcall(require("telescope").load_extension, "frecency")

-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader>so", require("telescope.builtin").oldfiles, { desc = "[o] Find recently opened files" })
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer]" })

vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", require("telescope.builtin").registers, { desc = "[S]earch [R]egisters" })
-- vim.keymap.set("n", "<leader>sp", require("telescope.builtin").projects, { desc = "[S]earch [P]rojects" })
vim.keymap.set("n", "<leader>sp", "<cmd>Telescope projects<CR>", { desc = "[S]earch [P]rojects" })
vim.keymap.set("n", "<C-s>", "<cmd>Telescope symbols<CR>", { desc = "Insert Symbols / Emojies" })
vim.keymap.set("i", "<C-s>", "<cmd>Telescope symbols<CR>", { desc = "Insert Symbols / Emojies" })
