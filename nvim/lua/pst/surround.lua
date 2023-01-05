local status_ok, surround = pcall(require, "nvim-surround")
if not status_ok then
  print("Problems with SURROUND-CONFIG")
  return
end
surround.setup({
  -- context_offset = 100,
  -- load_autogroups = false,
  -- mappings_style = "surround",
  -- map_insert_mode = true,
  -- quotes = { "'", '"' },
  -- brackets = { "(", "{", "[" },
  -- space_on_closing_char = false,
  -- pairs = {
  --   nestable = { { "(", ")" }, { "[", "]" }, { "{", "}" }, { "<", ">" } },
  --   linear = { { "'", "'" }, { "`", "`" }, { '"', '"' } },
  -- },
  -- prefix = "y",
})
