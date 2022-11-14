local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
	print("Problems with BLANKLINE-CONFIG")
end

indent_blankline.setup({
	buftype_exclude = { "terminal", "man", "nofile" },
	filetype_exclude = { "help", "NvimTree", "packer", "man", "lspinfo" },
	show_current_context = true,
	use_treesitter = true,
	use_treesitter_scope = true,

	context_patterns = {
		"class",
		"return",
		"^func",
		"method",
		"^if",
		"^while",
		"element",
		"^for",
		"with",
		"try",
		"except",
		"object",
		"^table",
		"tuple",
		"block",
		"dictionary",
		"arguments",
		"arguments_list",
		"if_statement",
		"else_clause",
		"jsx_element",
		"jsx_self_closing_element",
		"try_statement",
		"catch_clause",
		"import_statement",
		"operation_type",
	},
})
