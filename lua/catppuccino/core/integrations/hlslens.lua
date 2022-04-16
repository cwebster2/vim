local M = {}
-- cpt.bg
function M.get(cpt)
	return {
		HlSearchLens = { bg = cpt.bg, fg=cpt.comment },
		HlSearchLensNear = { bg = cpt.cyan, fg = cpt.black },
		HlSearchNear = { bg = cpt.cyan, fg = cpt.black },
		HlSearchFloat = { bg = cpt.bg, fg = cpt.comment },
	}
end

return M
