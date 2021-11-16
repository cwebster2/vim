local M = {}
local util = require("catppuccino.utils.util")

function M.get(cpt)
	return {
		NeogitBranch = { fg = cpt.magenta },
		NeogitRemote = { fg = cpt.pink },
		NeogitHunkHeader = { bg = cpt.bg_highlight, fg = cpt.fg },
		NeogitHunkHeaderHighlight = { bg = cpt.fg_gutter, fg = cpt.blue },
		NeogitDiffContextHighlight = { bg = cpt.none, fg = cpt.fg_alt },
		NeogitDiffDeleteHighlight = { bg = cpt.neogit.delbg, fg = cpt.fg },
		NeogitDiffAddHighlight = { bg = cpt.neogit.addbg, fg = cpt.fg },
	}
end

return M
