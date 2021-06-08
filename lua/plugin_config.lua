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

g.gitgutter_map_keys = 0
g.gitgutter_override_sign_column_highlight = 0
g.gitgutter_sign_added = "▎"
g.gitgutter_sign_modified = "▎"
g.gitgutter_sign_removed = "▏"
g.gitgutter_sign_removed_above_and_below = "▔"
g.gitgutter_sign_removed_first_line = "_"
g.gitgutter_sign_modified_removed = "▋"

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

g.pear_tree_repeatable_expand = 0
g.pear_tree_map_special_keys = 0
g.pear_tree_smart_openers = 1
g.pear_tree_smart_closers = 1
g.pear_tree_smart_backspace = 1

g.better_whitespace_ctermcolor='red'
g.better_whitespace_guicolor='red'
g.better_whitespace_enabled=1
g.strip_whitespace_on_save=1
g.strip_whitespace_confirm=0
g.better_whitespace_operator='_s'

g.symbols_outline = {
  highlight_hovered_item = true,
  show_guides = true,
  auto_preview = true,
  position = 'right',
  keymaps = {
      close = "<Esc>",
      goto_location = "<Cr>",
      focus_location = "o",
      hover_symbol = "<C-space>",
      rename_symbol = "r",
      code_actions = "a",
  },
  lsp_blacklist = {},
}

g.vim_markdown_folding_disabled = 1
g.vim_markdown_conceal = 0
g.tex_conceal = ""
g.vim_markdown_math = 1

g.vim_markdown_fenced_languages = {'css', 'javascript', 'js=javascript', 'typescript',
    'go', 'python', 'py=python', 'c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini'}

g.neoterm_default_mod = 'vertical'
g.neoterm_size = 60
g.neoterm_autoinsert = 1
g.neoterm_shell = '/bin/zsh'

vim.api.nvim_command[[
let test#strategy = "neovim"
let test#neovim#term_position = "vertical"
]]

g.startify_session_autoload = 1
g.startify_session_delete_buffers = 1
g.startify_change_to_vcs_root = 1
g.startify_fortune_use_unicode = 1
g.startify_session_persistence = 1

g.startify_lists = {
           { ['type'] = 'files',     ['header'] = {'   Files'}             },
           { ['type'] = 'dir',       ['header'] = {'   Current Directory'} },
           { ['type'] = 'sessions',  ['header'] = {'   Sessions'}          },
           { ['type'] = 'bookmarks', ['header'] = {'   Bookmarks'}         },
           }
g.startify_bookmarks = {
           { ['c'] = '~/.config/i3/config' },
           { ['k'] = '~/.config/kitty/kitty.conf' },
           { ['i'] = '~/.config/nvim/init.lua' },
           { ['z'] = '~/.zshrc' },
            '~/src',
           }

if vim.fn.exists("g:neovide") == 1 then
  g.neovide_transparency = 0.8
end

g.neuron_dir = os.getenv("HOME").."/src/zettel/"

require("presence"):setup({
  editing_text = "Editing [REDACTED]",
  workspace_text = "[REDACTED]",
  file_explorer_text = "Browsing [REDACTED]",
  reading_text = "Reading [REDACTED]",
})
