local M = {
  "norcalli/nvim-colorizer.lua",
  config = function()
    local status, colorizer = pcall(require, "colorizer")
    if not status then
      print("COLORIZER NOT LOADED")
      return
    end

    colorizer.setup({
      "*",
    })
  end,
}
return M
