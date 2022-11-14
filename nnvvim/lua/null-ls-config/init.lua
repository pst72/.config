local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	print("Problems with NUL-LS-CONFIG")
end
local formatting = require("null-ls").builtins.formatting
local diagnostics = require("null-ls").builtins.diagnostics
local code_actions = require("null-ls").builtins.code_actions

local sources = {
	--> formatters <--
	-- formatting.lua-format, --> Lua formatter
	formatting.stylua, --> lua formatter
	formatting.eslint, --> ts/js formatter
	formatting.autopep8, --> python formatter
	formatting.black, --> python formatter
	formatting.shfmt, --> shell formatter
	formatting.jq, --> json formatter
	formatting.prettier, --> formatter js, ts, jsx, tsx, vue, css, scss, less, html and more ..
	diagnostics.flake8,
	diagnostics.pylint,
	diagnostics.eslint,
	-- diagnostics.luacheck,
	diagnostics.selene,
	diagnostics.shellcheck,
	diagnostics.markdownlint, --> markdown style and syntax checker

	code_actions.eslint,
	code_actions.gitsigns,
	code_actions.shellcheck,
}

null_ls.setup({
	sources = sources,
	on_attach = function(client)
		if client.server_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		end
		-- vim.cmd([[
		--       augroup document_highlight
		--         autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
		--         autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
		--       augroup END
		--     ]])
	end,
})
