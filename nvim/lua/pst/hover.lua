-- Use a protected call so we don't error out on first use
local status_ok, hover = pcall(require, "hover")
if not status_ok then
	return
end

hover.setup({
	init = function()
		-- Require providers
		require("hover.providers.lsp")
		require("hover.providers.gh")
		require("hover.providers.man")
		require("hover.providers.dictionary")
	end,
	preview_opts = {
		border = "rounded",
	},
	preview_window = true,
	title = true,
})

-- Setup keymaps
vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })
