vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.confirm = true

vim.opt.fillchars = {
  eob = "~",
  vert = "│",
  foldopen = "",
  foldclose = "",
  foldsep = " ",
  fold = " ",
}
-- opt.foldtext = "nvim_treesitter#foldtext()"
vim.opt.foldtext =
  [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').' … ' . '(' . (v:foldend - v:foldstart + 1) . ' lines)']]
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = "expr"
vim.opt.foldenable = true
vim.opt.foldcolumn = "1"
vim.opt.foldnestmax = 3
vim.opt.laststatus = 3
