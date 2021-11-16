local M = {}

function M.get(cpt)
	return {
		TelescopeBorder = { fg = cpt.border_highlight },
		TelescopeSelectionCaret = { fg = cpt.cyan },
		TelescopeSelection = { fg = cpt.cyan, bg = cpt.bg_highlight },
		TelescopeMatching = { fg = cpt.blue },
	}
end

return M
