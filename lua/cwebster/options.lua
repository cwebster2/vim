vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.schedule(function()
  if vim.fn.has("unnamedplus") then
    vim.opt.clipboard = "unnamedplus"
  else
    vim.opt.clipboard = "unnamed"
  end
end)
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
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
vim.opt.foldtext =
  [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').' … ' . '(' . (v:foldend - v:foldstart + 1) . ' lines)']]
vim.opt.foldexpr = "nvim_treesitter.foldexpr()"
vim.opt.foldtext = "nvim_treesitter.foldtext()"
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = "expr"
vim.opt.foldenable = true
vim.opt.foldcolumn = "1"
vim.opt.foldnestmax = 3
vim.opt.laststatus = 3

vim.o.cmdheight = 1
require("vim._core.ui2").enable({
  enable = true,
  msg = {
    targets = {
      [""] = "msg",
      empty = "cmd",
      bufwrite = "msg",
      confirm = "cmd",
      emsg = "pager",
      echo = "msg",
      echomsg = "msg",
      echoerr = "pager",
      completion = "cmd",
      list_cmd = "pager",
      lua_error = "pager",
      lua_print = "msg",
      progress = "pager",
      rpc_error = "pager",
      quickfix = "msg",
      search_cmd = "cmd",
      search_count = "cmd",
      shell_cmd = "pager",
      shell_err = "pager",
      shell_out = "pager",
      shell_ret = "msg",
      undo = "msg",
      verbose = "pager",
      wildlist = "cmd",
      wmsg = "msg",
      typed_cmd = "cmd",
    },
    cmd = {
      height = 0.5,
    },
    dialog = {
      height = 0.5,
    },
    msg = {
      height = 0.3,
      timeout = 5000,
    },
    pager = {
      height = 0.5,
    },
  },
})
