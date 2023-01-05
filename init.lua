--a.nvim_command("profile start profile.log")
--a.nvim_command("profile func *")
--a.nvim_command("profile file *")

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- set global, window and buffer options
require("cwebster.options")

-- if this is being loaded by neovim running in vscode, bail
if vim.fn.exists('g:vscode') == 1 then
  do return end
end

-- require plugins and stuff
require("cwebster.earlystartup").setup()

require("lazy").setup("cwebster.plugins")

require("cwebster.mappings").init_keymap()
require("cwebster.mappings").setup_ft_mappings() --replace with ftdetect
require("cwebster.augroups")

vim.api.nvim_exec([[
  if has ("autocmd")
    filetype plugin indent on
  endif
]], '')

vim.api.nvim_command("silent! helptags ALL")

