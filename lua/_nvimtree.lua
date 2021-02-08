local M = {}

local g = vim.g
local map = require("utils").map

M.setup = function()
  g.nvim_tree_side = 'left'
  g.nvim_tree_width = 30
  g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' }
  g.nvim_tree_auto_open = 0
  g.nvim_tree_auto_close = 1
  g.nvim_tree_quit_on_open = 0
  g.nvim_tree_follow = 1
  g.nvim_tree_indent_markers = 1
  g.nvim_tree_hide_dotfiles = 1
  g.nvim_tree_git_hl = 1
  g.nvim_tree_root_folder_modifier = ':~'
  g.nvim_tree_tab_open = 1
  g.nvim_tree_width_allow_resize  = 1
  g.nvim_tree_show_icons = {
      git = 1,
      folders = 1,
      files = 1,
      }
  --If 0, do not show the icons for one of 'git' 'folder' and 'files'
  --1 by default, notice that if 'files' is 1, it will only display
  --if nvim-web-devicons is installed and on your runtimepath

  -- You can edit keybindings be defining this variable
  -- You don't have to define all keys.
  -- NOTE: the 'edit' key will wrap/unwrap a folder and open a file
  g.nvim_tree_bindings = {
      edit =            { '<CR>', 'o' },
      edit_vsplit =     '<C-v>',
      edit_split =      '<C-x>',
      edit_tab =        '<C-t>',
      close_node =      { '<S-CR>', '<BS>' },
      toggle_ignored =  'I',
      toggle_dotfiles = 'H',
      refresh =         'R',
      preview =         '<Tab>',
      cd =              '<C-]>',
      create =          'a',
      remove =          'd',
      rename =          'r',
      cut =             'x',
      copy =            'c',
      paste =           'p',
      prev_git_item =   '[c',
      next_git_item =   ']c',
      dir_up =          '-',
      close =           'q',
    }

  -- Disable default mappings by plugin
  -- Bindings are enable by default, disabled on any non-zero value
  -- let nvim_tree_disable_keybindings=1

  -- default will show icon by default if no icon is provided
  -- default shows no icon by default
  g.nvim_tree_icons = {
      default = '',
      symlink = '',
      git = {
        unstaged = "✗",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "★"
      },
      folder = {
        default = "",
        open = "",
        symlink = "",
      },
    }

  map('n', '<Leader>F', ':NvimTreeToggle<CR>', {noremap=true})
  --nnoremap <leader>r :NvimTreeRefresh<CR>
  map('n', '<Leader>f', ':NvimTreeFindFile<CR>', {noremap=true})
  -- NvimTreeOpen and NvimTreeClose are also available if you need them


  -- a list of groups can be found at `:help nvim_tree_highlight`
  -- set them in _theme.lua
end

return M
