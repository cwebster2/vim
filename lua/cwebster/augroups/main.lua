local autogroup_main = vim.api.nvim_create_augroup("vimrc-main", { clear = true })

local aucmds = {
  FocusLost = {
    {
      pattern = '*',
      callback = function()
        vim.cmd("silent! wa")
      end,
      group = autogroup_main,
    }
  },
  StdinReadPre = {
    {
      pattern = '*',
      callback = function()
        vim.cmd("let s:std_in=1")
      end,
      group = autogroup_main,
    }
  },
  TextYankPost = {
    {
      pattern = '*',
      callback = function()
        vim.highlight.on_yank({ higroup="Visual", timeout=200 })
      end,
      group = autogroup_main,
    }
  },
  TabLeave = {
    {
      pattern = '*',
      callback = function()
        vim.cmd("let g:lasttab = tabpagenr()")
      end,
      group = autogroup_main,
    }
  },
  BufWritePost = {
    {
      pattern = 'plugins.lua',
      callback = function()
        vim.cmd("PackerCompile")
      end,
      group = autogroup_main,
    }
  },
}

for event, opt_tbls in pairs(aucmds) do
    for _, opt_tbl in pairs(opt_tbls) do
        vim.api.nvim_create_autocmd(event, opt_tbl)
    end
end
