local opt = vim.opt
local augroup = require("utils").augroup

opt.autoindent = false
opt.autoread = true
opt.backspace = "indent,eol,start"
opt.backup = false
opt.clipboard = "unnamedplus,unnamed"
opt.cmdheight = 2
opt.colorcolumn = '100'
opt.completeopt = "menu,menuone,noselect"
opt.confirm = true
opt.cursorline = true
opt.diffopt = "filler,internal,algorithm:histogram,indent-heuristic"
opt.expandtab = true
opt.fillchars = {
  eob = "~",
  vert ="│",
}
opt.foldexpr='nvim_treesitter#foldexpr()'
opt.foldlevelstart = 99
opt.foldmethod='expr'
opt.formatoptions = opt.formatoptions --:gsub('[cro]','')
  - "a" -- Auto formatting is BAD.
  - "t" -- Don't auto format my code. I got linters for that.
  + "c" -- In general, I like it when comments respect textwidth
  + "q" -- Allow formatting comments w/ gq
  - "o" -- O and o, don't continue comments
  + "r" -- But do continue when pressing enter.
  + "n" -- Indent past the formatlistpat, not underneath it.
  + "j" -- Auto-remove comments if possible.
  - "2" -- I'm not in gradeschool anymore
opt.guifont = "Hack Nerd Font Mono:h18"
opt.hidden = true
opt.hlsearch = true
opt.ignorecase = true
opt.inccommand = 'split'
opt.incsearch = true
opt.lazyredraw = true
opt.linebreak = true
opt.list = true
opt.listchars = {
  tab="▷ ",
  trail="·",
  extends="…",
  precedes="…",
  conceal="┊",
  nbsp="○",
  eol="¬",
}
opt.matchtime = 5
opt.mouse = 'a'
opt.number = true
opt.pastetoggle = "<F11>"
opt.previewheight = 25
opt.pumblend = 15
opt.scrolloff = 5
opt.shell = "/bin/bash"
opt.shiftround = true
opt.shiftwidth = 2
opt.shortmess = vim.o.shortmess .. 'c'
opt.showmatch = true
opt.showmode = false
opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.softtabstop = 2
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 2
opt.termguicolors = true
opt.textwidth = 80
opt.ttimeoutlen = 50
opt.updatetime = 300
opt.viewoptions = "cursor,folds,options,unix,slash"
opt.virtualedit = "onemore"
opt.wildmenu = true
opt.wildmode = 'longest:full'
opt.winblend = 15
opt.winblend = 30
opt.writebackup = false

local function has(value)
  return vim.fn.has(value) == 1
end

if has('conceal') then
  opt.conceallevel = 2
  opt.concealcursor = "niv"
end

if vim.fn.exists("+undofile") == 1 then
  if vim.fn.isdirectory(vim.fn.expand("$HOME").."/.config/nvim/undo") == 0 then
      vim.api.nvim_command[[:silent !mkdir -p ~/.config/nvim/undo > /dev/null 2>&1]]
  end
  opt.undodir = "./.vim-undo//,"..vim.fn.expand("$HOME").."/.config/nvim/undo//"
  opt.undofile = true
end

if has('persistent_undo') then
  opt.undofile = true
  opt.undolevels = 250
  opt.undoreload = 500
end

augroup("ftspelloptions", {
  {"FileType", "gitcommit", "set spell"},
})
