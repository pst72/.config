local status_ok, code = pcall(require, "codeium")
if not status_ok then
	return
end

code.setup()

-- Codeium keymaps
-- vim.g.codeium_enabled = false
vim.g.codeium_disable_keymaps = true
vim.keymap.set("i", "<c-n>", function()
	return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true })
vim.keymap.set("i", "<c-p>", function()
	return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true })
vim.keymap.set("i", "<c-x>", function()
	return vim.fn["codeium#Clear"]()
end, { expr = true })
vim.keymap.set("i", "<c-cr>", function()
	return vim.fn["codeium#Accept"]()
end, { expr = true })
