local M = {
  "rmagatti/alternate-toggler",
  -- local status_ok, alt = pcall(require, "alternate-toggler")
  -- if not status_ok then
  --     return
  -- end

  config = {
    alternates = {
      ["==="] = "!==",
      ["=="] = "!=",
    },
  },

  vim.keymap.set("n", "<leader>aa", "<cmd>ToggleAlternate<cr>"),
}
return M
