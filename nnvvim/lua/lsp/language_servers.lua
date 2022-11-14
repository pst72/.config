local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local lsp_defaults = {
	flags = {
		debounce_text_changes = 150,
	},
	capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	capabilities.textDocument.completion.completionItem.snippetSupport == true,
	on_attach = function(client, bufnr)
		vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
		client.capabilities.textDocument.completion.completionItem.snippetSupport = true
	end,
}
local lspconfig = require("lspconfig")

lspconfig.util.default_config = vim.tbl_deep_extend("force", lspconfig.util.default_config, lsp_defaults)
local server = { "sumneko_lua", "pyright", "vimls", "bash-ls", "eslint", "prettier" }
-- local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- local opts = { capabilities = capabilities }
if server.name == "sumneko_lua" then
	opts = vim.tbl_deep_extend("force", {
		settings = {
			Lua = {
				runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
				diagnostics = { globals = { "vim" } },
				workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
				telemetry = { enable = false },
			},
		},
	}, lsp_defaults)
end
if server.name == "pyright" then
	local python_lsp_server_opts = require("user.lsp.settings.pyright")
	opts = vim.tbl_deep_extend("force", python_lsp_server_opts, lsp_defaults)
end
server:setup(opts)

require("lspconfig").bashls.setup({ lsp_defaults })
require("lspconfig").eslint.setup({ lsp_defaults })
require("lspconfig").tsserver.setup({ lsp_defaults })
require("lspconfig").pyright.setup({ lsp_defaults })
require("lspconfig").vimls.setup({ lsp_defaults })
