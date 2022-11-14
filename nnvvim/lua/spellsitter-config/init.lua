local status_ok, spellsitter = pcall(require, "spellsitter")
if not status_ok then
	print("Problems with SPELLSITTER-CONFIG")
end
spellsitter.setup({
	enable = true,
})
