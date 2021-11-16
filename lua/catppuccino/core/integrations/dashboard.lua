local M = {}

function M.get(cpt)
	return {
		DashboardShortCut = { fg = cpt.cyan },
		DashboardHeader = { fg = cpt.yellow },
		DashboardCenter = { fg = cpt.green },
		DashboardFooter = { fg = cpt.orange, style = "italic" },
	}
end

return M
