local g = vim.g
local a = vim.api

--a.nvim_command("profile start profile.log")
--a.nvim_command("profile func *")
--a.nvim_command("profile file *")

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
g.mapleader = " "
g.maplocalleader = ","

g.have_nerd_font = true

-- set global, window and buffer options
require("cwebster.options")
require("cwebster.keymaps")
require("cwebster.autocommands")
-- require("cwebster.earlystartup").setup()

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("cwebster.plugins"
, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  }
})

a.nvim_command("silent! helptags ALL")
