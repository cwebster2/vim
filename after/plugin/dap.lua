local ok, dap = pcall(require, "dap")

if not ok then
  print("dap not installed, run PackerSync")
  do return end
end

local map = require("cwebster.utils").map

-- mapping
map("n", "<leader>dh", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Breakpoint"})
map("n", "<leader>ds", "<cmd>lua require'dap'.close()<CR>", { desc = "Stop"})
map("n", "<leader>dn", "<cmd>lua require'dap'.continue()<CR>", { desc = "Cont"})
map("n", "<leader>dk", "<cmd>lua require'dap'.up()<CR>", { desc = "Up"})
map("n", "<leader>dj", "<cmd>lua require'dap'.down()<CR>", { desc = "Down"})
map("n", "<leader>d_", "<cmd>lua require'dap'.disconnect();require'dap'.stop();require'dap'.run_last()<CR>", { desc = "Disco"})
map("n", "<leader>dr", "<cmd>lua require'dap'.repl.open({}, 'vsplit')<CR><C-w>l", { desc = "REPL"})
    -- ["i"] = { "<cmd>lua require'dap.ui.variables'.hover()<CR>", "" },
    -- ["?"] = { "<cmd>lua require'dap.ui.variables'.scopes()<CR>", "" },
map("n", "<leader>de", "<cmd>lua require'dap'.set_exception_breakpoints({'all'})<CR>", { desc = "Enable BPs"})
map("n", "<leader>da", "<cmd>lua require'debugHelper'.attach()<CR>", { desc = "Attack"})
map("n", "<leader>dA", "<cmd>lua require'debugHelper'.attachToRemote()<CR>", { desc = "Att Remote"})
map("n", "<leader>di", "<cmd>lua require'dap.ui.widgets'.hover()<CR>", { desc = "UI"})
map("n", "<leader>d?", "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>", { desc = "Scopes"})
map("n", "<leader>df", "<cmd>Telescope dap frames<CR>", { desc = "Frames"})
map("n", "<leader>dc", "<cmd>Telescope dap commands<CR>", { desc = "Commands"})
map("n", "<leader>db", "<cmd>Telescope dap list_breakpoints<CR>", { desc = "List BPs"})

-- config
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

