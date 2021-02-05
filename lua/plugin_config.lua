local g = vim.g

g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}

g.fzf_command_prefix = 'F'

g.DevIconsEnableFoldersOpenClose = 1

g.gitgutter_map_keys = 0
g.gitgutter_override_sign_column_highlight = 0
g.gitgutter_sign_added = "▎"
g.gitgutter_sign_modified = "▎"
g.gitgutter_sign_removed = "▏"
g.gitgutter_sign_removed_above_and_below = "▔"
g.gitgutter_sign_removed_first_line = "_"
g.gitgutter_sign_modified_removed = "▋"

g.indentLine_char = '▏'
g.indentLine_color_gui = '#222222'

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

g.vim_markdown_folding_disabled = 1
g.vim_markdown_conceal = 0
g.tex_conceal = ""
g.vim_markdown_math = 1

g.vim_markdown_fenced_languages = {'css', 'javascript', 'js=javascript', 'typescript',
    'go', 'python', 'py=python', 'c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini'}

g.neoterm_default_mod = 'vertical'
g.neoterm_size = 60
g.neoterm_autoinsert = 1

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
