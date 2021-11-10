local g = vim.g

g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}
g.qs_buftype_blacklist = {'terminal', 'nofile'}
g.qs_lazy_highlight = 1

g.fzf_command_prefix = 'F'

require("nvim_comment").setup({
  comment_empty = false,
})

g.DevIconsEnableFoldersOpenClose = 1

g.polyglot_disabled = { "autoindent", "sensible" }

g.vim_markdown_folding_disabled = 1
g.vim_markdown_conceal = 0
g.tex_conceal = ""
g.vim_markdown_math = 1

g.vim_markdown_fenced_languages = {'css', 'javascript', 'js=javascript', 'typescript',
    'go', 'python', 'py=python', 'c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini'}

vim.api.nvim_command[[
let test#strategy = "neovim"
let test#neovim#term_position = "vertical"
]]


if vim.fn.exists("g:neovide") == 1 then
  g.neovide_transparency = 0.8
end

g.neuron_dir = os.getenv("HOME").."/src/zettel/"

