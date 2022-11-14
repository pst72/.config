local status_ok, autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
	print("Problems with AUTOPAIRS-CONFIG")
end
autopairs.setup({
	check_ts = true,
	ts_config = {
		lua = { "string", "source" },
		javascript = { "string", "template_string" },
		java = false,
	},
	disable_filetype = { "TelescopePrompt", "spectre_panel" },
	fast_wrap = {
		map = "<M-e>",
		chars = { "{", "[", "(", "<", "'", '"' },
		highlight = "PmenuSel",
		highlight_grey = "LineNr",
		check_comma = true,
		offset = 0,
	},
})
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
