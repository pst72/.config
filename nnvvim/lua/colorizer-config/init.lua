local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
	print("Problems with COLORIZER-CONFIG")
end

colorizer.setup({ "*" }, {
	RGB = true,
	RRGGBB = true,
	names = true,
	RRGGBBAA = true,
	rgb_fn = true,
	hsl_fn = true,
	css = true,
	css_fn = true,
	mode = "foreground",
})
