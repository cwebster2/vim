local g = vim.g
local a = vim.api
local augroup = require("cwebster.utils").augroup

a.nvim_command("set nocompatible")
--a.nvim_command("profile start profile.log")
--a.nvim_command("profile func *")
--a.nvim_command("profile file *")

g.mapleader = ' '
g.maplocalleader = ','

-- set global, window and buffer options
require'cwebster.options'

-- if this is being loaded by neovim running in vscode, bail
if vim.fn.exists('g:vscode') == 1 then
  do return end
end

-- some globals that need setting before plugins are loaded
g.python3_host_prog = os.getenv("HOME") .. '/miniconda3/bin/python3'
g.loaded_netrwPlugin = 1
g.jsx_ext_required = 0

-- require plugins and stuff
require'cwebster.plugins'
require('cwebster.mappings').init_keymap()
require'cwebster.plugin_config'
require('cwebster.mappings').setup_ft_mappings()

require("cwebster.colors").setup()

a.nvim_exec([[
  if has ("autocmd")
    filetype plugin indent on
  endif
]], '')

augroup("vimrc-main", {
  -- save when focus lost
  {'FocusLost', '*', 'silent! wa'},
  {'StdinReadPre', '*', 'let s:std_in=1'},
  -- strip trailing whitespace
  -- vim.cmd [[ autocmd BufWritePre * :%s/\s\+$//e ]]
  -- starphleet
  {'BufRead,BufNewFile', 'after_containerize,on_containerize,orders', 'set filetype=sh'},
  {'BufRead,BufNewFile', '~/.zfunc/*', 'set filetype=zsh'},
  -- tab management
  {'TabLeave', '*', 'let g:lasttab = tabpagenr()'},
  -- highlight yanks
  {'TextYankPost', '*', 'silent! lua vim.highlight.on_yank { higroup="Visual", timeout=200 }' },
  {'FileType', 'markdown', 'setlocal spell'},
  {'BufWritePost', 'plugins.lua', 'PackerCompile'},
})

augroup("numbertoggle", {
  {'BufEnter,FocusGained,InsertLeave,WinEnter', '*', 'if &nu | set rnu   | endif'},
  {'BufLeave,FocusLost,InsertEnter,WinLeave',   '*', 'if &nu | set nornu | endif'},
})

-- we are done setting stuff up
a.nvim_command("silent! helptags ALL")

