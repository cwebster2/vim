-- NOTE: references for Catppuccin Mocha
-- monochromatic: https://coolors.co/c6d0f5-aeb7d9-969dbc-7e84a0-666a83-4e5167-36374a-1e1e2e-12121c-07070a
-- analogous 1: https://coolors.co/f5e0dc-f2cdcd-f5c2e7-cba6f7-eba0ac-f38ba8-fab387
-- analogous 2: https://coolors.co/bfb7e4-8caaee-99d1db-e5c890-85c1dc-a6d189-81c8be

local color_palette = {
	rosewater = "#F5E0DC",
	flamingo = "#F2CDCD",
	pink = "#F5C2E7",
	mauve = "#CBA6F7",
	red = "#F38BA8",
	maroon = "#EBA0AC",
	peach = "#FAB387",
	yellow = "#F9E2AF",
	-- green = "#A6E3A1",
	-- green = "#25be6a",
	green = "#42be65",
	teal = "#94E2D5",
	sky = "#89DCEB",
	sapphire = "#74C7EC",
	blue = "#89B4FA",
	lavender = "#B4BEFE",


	magenta = "#c678dd",
	cyan = "#63cdcf",
	white = "#dfdfe0",
	orange = "#F4A261",
	gray = "#2a2e36",

	text = "#CDD6F4",
	subtext1 = "#BAC2DE",
	subtext0 = "#A6ADC8",
	overlay2 = "#9399B2",
	overlay1 = "#7F849C",
	overlay0 = "#6C7086",
	surface2 = "#585B70",
	surface1 = "#45475A",
	surface0 = "#313244",

	base = "#1E1E2E",
	mantle = "#181825",
	crust = "#11111B",

	none = "NONE",
}

color_palette.diff = { -- git and native diffs
	add = "green",
	change = "#2B5B77",
	delete = "red",
	text = color_palette.blue,
	conflict = color_palette.magenta,
}

color_palette.warning = color_palette.yellow
color_palette.info = color_palette.blue
color_palette.hint = color_palette.teal
color_palette.variable = color_palette.text

return color_palette
