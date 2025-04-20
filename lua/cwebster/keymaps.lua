-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

  vim.api.nvim_exec(
    [[
    set wildcharm=<C-Z>
    cnoremap  <expr> <up> wildmenumode() ? "\<left>" : "\<up>"
    cnoremap  <expr> <down> wildmenumode() ? "\<right>" : "\<down>"
    cnoremap  <expr> <left> wildmenkeyumode() ? "\<up>" : "\<left>"
    cnoremap  <expr> <right> wildmenumode() ? "\<bs><C-Z>" : "\<right>"
  ]],
    {}
  )

  -- Toggle to disable mouse mode and indentlines for easier paste
  ToggleMouse = function()
    if vim.o.mouse == "a" then
      vim.cmd([[IndentBlanklineDisable]])
      vim.wo.signcolumn = "no"
      vim.o.mouse = "v"
      vim.wo.number = false
      vim.wo.relativenumber = false
      print("Mouse disabled")
    else
      vim.cmd([[IndentBlanklineEnable]])
      vim.wo.signcolumn = "yes"
      vim.o.mouse = "a"
      vim.wo.number = true
      print("Mouse enabled")
    end
  end

  vim.api.nvim_set_keymap(
    "n",
    "<F10>",
    "<cmd>lua ToggleMouse()<cr>",
    { noremap = true, desc = "Toggle mouse for paste" }
  )

  -- visual mode indent keep selection
  vim.keymap.set("v", "<", "<gv", { noremap = true })
  vim.keymap.set("v", ">", ">gv", { noremap = true })
  vim.keymap.set("v", ".", ":normal .<CR>", { noremap = true })

vim.keymap.set("n", "k", function()
  return vim.v.count > 0 and "m'" .. vim.v.count .. "k" or "gk"
end, { expr = true })

vim.keymap.set("n", "j", function()
  return vim.v.count > 0 and "m'" .. vim.v.count .. "j" or "gj"
end, { expr = true })
