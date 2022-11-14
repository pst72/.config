local status_ok, comment = pcall(require, "nvim_comment")
if not status_ok then
	print("Problems with COMMENT-CONFIG")
end
comment.setup({
	line_mapping = "<leader>c",
	operator_mapping = "gcc",
  comment_chunk_text_object = "ic",
	comment_empty = true,
  hook = function(ctx)
    require("ts_context_commentstring.internal").update_commentstring(ctx)
  end,
})
