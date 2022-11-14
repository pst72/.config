local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	print("Problems with NVIMTREE-CONFIG")
end

nvim_tree.setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	-- filters_custom = { "*.tmp", ".git", "node_modules", ".cache" },
	ignore_ft_on_setup = {},
	open_on_tab = false,
	hijack_cursor = true,
	update_cwd = true,
	respect_buf_cwd = true,
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	system_open = {
		cmd = nil,
		-- the command arguments as a list
		args = {},
	},
	renderer = {
		add_trailing = true,
		group_empty = false,
		highlight_git = true,
		highlight_opened_files = "all",
		root_folder_modifier = ":~",
		indent_markers = {
			enable = true,
			icons = {
				corner = "└ ",
				edge = "│ ",
				none = "  ",
			},
		},
	},
})
