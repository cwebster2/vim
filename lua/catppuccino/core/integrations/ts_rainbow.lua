local M = {}

function M.get(cpt)
	return {
		rainbowcol1 = {bg = cpt.none, fg = cpt.red},
		rainbowcol2 = {bg = cpt.none, fg = cpt.green},
		rainbowcol3 = {bg = cpt.none, fg = cpt.yellow},
		rainbowcol4 = {bg = cpt.none, fg = cpt.blue},
		rainbowcol5 = {bg = cpt.none, fg = cpt.magenta},
		rainbowcol6 = {bg = cpt.none, fg = cpt.cyan},
		rainbowcol7 = {bg = cpt.none, fg = cpt.white},
	}
end

return M
