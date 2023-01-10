local M = {}
local g = vim.g

function M.setup()
	g.indentLine_char = "▏"
	g.indent_blankline_char_highlight = "IndentGuides"
	g.indent_blankline_use_treesitter = true
	g.indent_blankline_show_current_context = true
	g.indent_blankline_filetype_exclude = {
		"help",
		"vimwiki",
		"startify",
		"man",
		"git",
		"packer",
		"gitmessengerpopup",
		"diagnosticpopup",
		"markdown",
		"lspinfo",
	}
	g.indent_blankline_context_patterns = {
		"class",
		"function",
		"method",
		"^if",
		"while",
		"for",
		"with",
		"func_literal",
		"block",
		"try",
		"except",
		"argument_list",
		"object",
		"dictionary",
	}
end

return M
