local M = {}
local util = require("catppuccino.utils.util")

function M.get(cpt)
	return {
		CmpItemAbbr = { fg = util.darken(cpt.white, 0.56) },
		CmpItemAbbrDeprecated = { fg = "#808080", style = "strikethrough" },
		CmpItemMenu = { fg = cpt.fg },
		CmpItemKind = { fg = cpt.blue },
		CmpItemAbbrMatch = { fg = "#569CD6", style = "bold" },
		CmpItemAbbrMatchFuzzy = { fg = "#569CD6", style = "bold" },

-- vscode colors?
-- highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
-- highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
-- highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
-- highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
-- highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
-- highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
-- highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
-- highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4

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
    CmpItemKindCopilot = { fg = "#6CC644" },
	}
end

return M
