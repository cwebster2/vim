local M = {}

local utils = require("catppuccino.utils.util")

local function load(colorscheme)
	local catppuccino = require("catppuccino")

	if catppuccino.before_loading ~= nil then
		catppuccino.before_loading()
	end

	-- colorscheme gets evaluated from mapper.lua
	local theme = require("catppuccino.core.mapper").apply(colorscheme)
	utils.load(theme)

	if catppuccino.after_loading ~= nil then
		catppuccino.after_loading()
	end
end

local function clear()
	vim.cmd("hi clear")
end

function M.main(option, args)
	option = option or "load"

	if option == "load" then
		load(args)
	elseif option == "clear" then
		clear()
	else
		print("Catppuccino: option was not recognized")
	end
end

return M
