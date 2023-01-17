local status_ok, alt = pcall(require, "alternate-toggler")
if not status_ok then
	return
end

alt.setup({
	alternates = {
		["==="] = "!==",
		["=="] = "!=",
	},
})

vim.keymap.set("n", "<leader>aa", "<cmd>ToggleAlternate<cr>")
