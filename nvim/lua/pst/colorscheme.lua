-- local colorscheme = "darkplus"
local colorscheme = "terafox"
-- local colorscheme = "deepocean"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
