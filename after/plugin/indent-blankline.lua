local g = vim.g

local ok, indent_blankline = pcall(require, "indent_blankline")

if not ok then
  print("indent_blankline not installed, run PackerSync")
  do return end
end

g.indentLine_char = '▏'
g.indent_blankline_char_highlight = 'IndentGuides'
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
  "lspinfo"
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
  "dictionary"
}

indent_blankline.setup({
  -- show_end_of_line = true,
  space_char_blankline = " ",
  show_current_context = true,
  -- show_current_context_start = true,
  show_trailing_blankline_indent = true,
  -- char_highlight_list = {
  --     "IndentBlanklineIndent1",
  --     "IndentBlanklineIndent2",
  --     "IndentBlanklineIndent3",
  --     "IndentBlanklineIndent4",
  --     "IndentBlanklineIndent5",
  --     "IndentBlanklineIndent6",
  -- },
})

