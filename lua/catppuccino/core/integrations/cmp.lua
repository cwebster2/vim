local M = {}
local util = require("catppuccino.utils.util")

function M.get(cpt)
	return {
		CmpItemAbbr = { fg = util.darken(cpt.white, 0.56) },
		CmpItemAbbrDeprecated = { fg = util.darken(cpt.white, 0.56), style = "strikethrough" },
		CmpItemMenu = { fg = cpt.fg },
		CmpItemKind = { fg = cpt.blue },
		CmpItemAbbrMatch = { fg = cpt.yellow, style = "bold" },
		CmpItemAbbrMatchFuzzy = { fg = cpt.fg, style = "bold" },


		-- CmpItemKindVariable = { fg = cpt.blue_br },
		-- CmpItemKindInterface = { fg = cpt.cyan_br },
		-- CmpItemKindText = { fg = cpt.orange_br },
		-- CmpItemKindFunction = { fg = cpt.magenta_br },
		-- CmpItemKindMethod = { fg = cpt.magenta_br },
		-- CmpItemKindKeyword = { fg = cpt.blue_br },
		-- CmpItemKindConstructor = { fg = cpt.red_br },
		-- CmpItemKindField = { fg = cpt.pink_br },
		-- CmpItemKindValue = { fg = cpt.blue_br },
		-- CmpItemKindSnippet = { fg = cpt.green_br },
		-- CmpItemKindFile = { fg = cpt.red_br },
		-- CmpItemKindFolder = { fg = cpt.blue_br },

		CmpItemKindSnippet = { fg = cpt.mauve },
		CmpItemKindKeyword = { fg = cpt.red },
		CmpItemKindText = { fg = cpt.teal },
		CmpItemKindMethod = { fg = cpt.blue },
		CmpItemKindConstructor = { fg = cpt.blue },
		CmpItemKindFunction = { fg = cpt.blue },
		CmpItemKindFolder = { fg = cpt.blue },
		CmpItemKindModule = { fg = cpt.blue },
		CmpItemKindConstant = { fg = cpt.peach },
		CmpItemKindField = { fg = cpt.green },
		CmpItemKindProperty = { fg = cpt.green },
		CmpItemKindEnum = { fg = cpt.green },
		CmpItemKindUnit = { fg = cpt.green },
		CmpItemKindClass = { fg = cpt.yellow },
		CmpItemKindVariable = { fg = cpt.flamingo },
		CmpItemKindFile = { fg = cpt.blue },
		CmpItemKindInterface = { fg = cpt.yellow },
		CmpItemKindColor = { fg = cpt.red },
		CmpItemKindReference = { fg = cpt.red },
		CmpItemKindEnumMember = { fg = cpt.red },
		CmpItemKindStruct = { fg = cpt.blue },
		CmpItemKindValue = { fg = cpt.peach },
		CmpItemKindEvent = { fg = cpt.blue },
		CmpItemKindOperator = { fg = cpt.blue },
		CmpItemKindTypeParameter = { fg = cpt.blue },
	}
end

return M
