local status_ok, lsp_sig = pcall(require, "lsp_signature")
if not status_ok then
	print("Problem with LSP-SIGNATURE-CONFIG")
end
lsp_sig.on_attach({
	bind = true,
	handler_opts = {
		border = "rounded",
	},
})
