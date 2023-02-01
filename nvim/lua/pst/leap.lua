local status_ok, leap = pcall(require, "leap")
if not status_ok then
	return
end

leap.setup({
	case_insensitive = true,
	default_keymaps = true,
	-- Leaving the appropriate list empty effectively disables "smart" mode,
	-- and forces auto-jump to be on or off.
	-- safe_labels = { . . . },
	-- labels = { . . . },
	-- These keys are captured directly by the plugin at runtime.
	special_keys = {
		repeat_search = "<enter>",
		next_match = "<enter>",
		prev_match = "<tab>",
		next_group = "<space>",
		prev_group = "<tab>",
		eol = "<space>",
	},
})
require("leap").add_default_mappings()

-- Bidirectional search in the current window is just a specific case of the
-- multi-window mode
require("leap").leap({ target_windows = { vim.fn.win_getid() } })

-- Map them to your preferred key, like:
-- vim.keymap.set("n", "s", leap_all_windows, { silent = true })
-- vim.keymap.set("v", "s", leap_forward, { silent = true })
