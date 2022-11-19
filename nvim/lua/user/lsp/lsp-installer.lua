local status_ok, lsp_installer = pcall(require, "mason.nvim")
if not status_ok then
  return
end

local servers = {
	"sumneko_lua",
	"cssls",
	"html",
	"tsserver",
	-- "prettier",
	"pyright",
	"bashls",
	"jsonls",
	"yamlls",
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

lsp_installer.setup({
	ensure_installed = servers,
})

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end

	lspconfig[server].setup(opts)
end
