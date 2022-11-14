-- Setup nvim-cmp.
local lspkind = require("lspkind")
local luasnip = require("luasnip.loaders.from_vscode").lazy_load()
local types = require("cmp.types")
require("luasnip.loaders.from_vscode").lazy_load()
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end
vim.g.completeopt = "menu,menuone,noselect"
local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- local feedkey = function(key, mode)
-- vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
-- end

cmp.setup({
	snippet = {
		expand = function(args)
			-- For `vsnip` user.
			-- vim.fn["vsnip#anonymous"](args.body)
			-- For `luasnip` user.
			require("luasnip").lsp_expand(args.body)
			-- For `ultisnips` user.
			-- vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-Down>"] = cmp.mapping.scroll_docs(4),
		["<C-Up>"] = cmp.mapping.scroll_docs(-4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
    ["<C-n>"] = cmp.mapping.select_next_item { behavior = types.cmp.SelectBehavior.Select },
    ["<C-p>"] = cmp.mapping.select_prev_item { behavior = types.cmp.SelectBehavior.Select },
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item { behavior = types.cmp.SelectBehavior.Select }
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item { behavior = types.cmp.SelectBehavior.Select }
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
			end
		end, { "i", "s" }),
	}),
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "nvim-lua" },
		{ name = "cmdline" },
	},
	formatting = {
		format = lspkind.cmp_format({ symbol_text = true, maxwidth = 60 }),
		fields = { "menu", "abbr", "kind" },
		menu = {
			nvim_lsp = "[LSP]",
			luasnip = "[Snip]",
			buffer = "[Buf]",
			nvim_lua = "[Lua]",
			path = "[Path]",
			cmdline = "[CmdL]",
		},
	},
	experimental = {
		native_menu = false,
		ghost_text = true,
	},
})
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})
