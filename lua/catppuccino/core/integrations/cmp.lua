local M = {}
local util = require("catppuccino.utils.util")

function M.get(cpt)
	return {
		CmpItemAbbr = { fg = util.darken(cpt.white, 0.56) },
		CmpItemAbbrDeprecated = { fg = util.darken(cpt.white, 0.56), stlye = "strikethrough" },
		CmpItemAbbrMatch = { fg = cpt.yellow, style = "bold" },
		CmpItemAbbrMatchFuzzy = { fg = cpt.fg, style = "bold" },
		CmpItemKindVariable = { fg = cpt.blue_br },
		CmpItemKindInterface = { fg = cpt.cyan_br },
		CmpItemKindText = { fg = cpt.orange_br },
		CmpItemKindFunction = { fg = cpt.magenta_br },
		CmpItemKindMethod = { fg = cpt.magenta_br },
		CmpItemKindKeyword = { fg = cpt.blue_br },
		CmpItemKindConstructor = { fg = cpt.red_br },
		CmpItemKindField = { fg = cpt.pink_br },
		CmpItemKindValue = { fg = cpt.blue_br },
		CmpItemKindSnippet = { fg = cpt.green_br },
		CmpItemKindFile = { fg = cpt.red_br },
		CmpItemKindFolder = { fg = cpt.blue_br },
		CmpItemMenu = { fg = cpt.blue },
	}
end

return M
