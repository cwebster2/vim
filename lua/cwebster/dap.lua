local dap = require('dap')

local M = {}

function M.setup()
  dap.adapters.node2 = {
    type = 'executable',
    command = 'node',
    args = {os.getenv('HOME') .. '/src/vscode-node-debug2/out/src/nodeDebug.js'},
  }

  dap.configurations.javascript = {
    {
      type = 'node2',
      request = 'launch',
      program = '${file}',
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = 'inspector',
      console = 'integratedTerminal',
    },
  }
  vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
  vim.fn.sign_define('DapStopped', {text='⭐️', texthl='', linehl='', numhl=''})

  require("nvim-dap-virtual-text").setup{
    enabled = true,
  }

  vim.api.nvim_exec([[
  " Debugger remaps
  nnoremap <leader>dd :TestNearest -strategy=jest<CR>
  function! JestStrategy(cmd)
    let testName = matchlist(a:cmd, '\v -t ''(.*)''')[1]
    call vimspector#LaunchWithSettings( #{ configuration: 'jest', TestName: testName } )
  endfunction
  let g:test#custom_strategies = {'jest': function('JestStrategy')}
  ]],'')
end

return M
