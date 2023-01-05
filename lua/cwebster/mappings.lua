local map = require("cwebster.utils").map
local augroup = require("cwebster.utils").augroup
local wk = require("which-key")

local M = {}


M.init_keymap = function()

  -- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
  -- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

  vim.keymap.set("n", "J", "mzJ`z")
  vim.keymap.set("n", "<C-d>", "<C-d>zz")
  vim.keymap.set("n", "<C-u>", "<C-u>zz")

  map("n", "<leader>z", function()
      require("notify").dismiss()
      vim.cmd.noh()
    end, { desc = "Clear hightlights and notifications"})

  map("n", "<leader>hpp", "<cmd>PackerSync<cr>", { desc = "Sync"})
  map("n", "<leader>hps", "<cmd>PackerStatus<cr>", { desc = "Status"})
  map("n", "<leader>hpi", "<cmd>PackerInstall<cr>", { desc = "Install"})
  map("n", "<leader>hpc", "<cmd>PackerCompile<cr>", { desc = "Compile"})

  map("n", "<leader>bb", '<cmd>e#<CR>', { desc = "Last Buffer"})
  map("n", "<leader>bv", function() require("cwebster.utils").scratchBuffer("vsplit") end, { desc = "Scrach buffer in vert split"})
  map("n", "<leader>fn", "<cmd>enew<CR>", { desc = "New File" })
  map("n", "<leader>sc", function() vim.cmd.noh() end, { desc = "Clear search highlight"})

  -- what ar these from?
  map("n", "<leader>tt", "<cmd>TestNearest<CR>", { desc = "Nearest"})
  map("n", "<leader>tf", "<cmd>TestFile<CR>", { desc = "File"})
  map("n", "<leader>ts", "<cmd>TestSuite<CR>", { desc = "Suite"})
  map("n", "<leader>t_", "<cmd>TestLast<CR>", { desc = "Last"})

-- nnoremap <S-k> :lua require'dap'.step_out()<CR>
-- nnoremap <S-l> :lua require'dap'.step_into()<CR>
-- nnoremap <S-j> :lua require'dap'.step_over()<CR>

  map("v", "J", "<cmd>m '>+1<CR>gv=gv", { desc = "Move down" })
  map("v", "K", "<cmd>m '<-2<CR>gv=gv", { desc = "Move up"})
-- vnoremap <leader>di :lua require'dap.ui.variables'.visual_hover()<CR>

  -- testing
  --map('n', '<Leader>fo', "<cmd>lua require('telescope.builtin').colorscheme()<CR>", {noremap=true})

  -- move between splits
  --map('n', '<C-m>', '<C-w><C-h>', {noremap=true})
  --map('n', '<C-n>', '<C-w><C-j>', {noremap=true})
  --map('n', '<C-e>', '<C-w><C-k>', {noremap=true})
  --map('n', '<C-i>', '<C-w><C-l>', {noremap=true})

  -- visual mode indent keep selection
  map('v', '<', '<gv', {noremap=true})
  map('v', '>', '>gv', {noremap=true})
  map('v', '.', ':normal .<CR>', {noremap=true})

  -- visual line movement
  map('', 'j', '(v:count == 0 ? \'gj\' : \'j\')', {expr=true,noremap=true,silent=true})
  map('', '<Down>', '(v:count == 0 ? \'gj\' : \'<Down>\')', {expr=true,noremap=true,silent=true})
  map('', 'k', '(v:count == 0 ? \'gk\' : \'k\')', {expr=true,noremap=true,silent=true})
  map('', '<Up>', '(v:count == 0 ? \'gk\' : \'<Up>\')', {expr=true,noremap=true,silent=true})

  map("i", "<A-t>", 'copilot#Accept("")', {expr=true,noremap=true,silent=true})
  -- quick spilt
  map('n', '<Leader>v', '<C-w>v<C-w>w', {})

  -- map('c', "<up>", 'wildmenumode() ? "\<left>" : "\<up>"', {expr=true, noremap=true, silent=true})
  vim.api.nvim_exec([[
    set wildcharm=<C-Z>
    cnoremap  <expr> <up> wildmenumode() ? "\<left>" : "\<up>"
    cnoremap  <expr> <down> wildmenumode() ? "\<right>" : "\<down>"
    cnoremap  <expr> <left> wildmenumode() ? "\<up>" : "\<left>"
    cnoremap  <expr> <right> wildmenumode() ? "\<bs><C-Z>" : "\<right>"
  ]],{})

  map('n', '+', '<C-a>', {})
  map('n', '-', '<C-x>', {})

  -- spell
  map ('n', '<F9>', ':set spell!<cr>', {silent=true})
  map ('i', '<F9>', '<C-O>:set spell!<cr>', {silent=true})

  -- location list
  map('n', '<Leader>ll', ':lopen<cr>', {})
  map('n', '<Leader>j', ':lnext<cr>', {})
  map('n', '<Leader>k', ':lprev<cr>', {})
  map('n', '<Leader>lc', ':lclose<cr>', {})

  -- quick list
  map('n', '<Leader>ql', ':copen<cr>', {})
  map('n', '<Leader>qn', ':cnext<cr>', {})
  map('n', '<Leader>qp', ':cprev<cr>', {})
  map('n', '<Leader>qc', ':cclose<cr>', {})

  -- maximizer
  map('n', '<F3>', ':MaximizerToggle<CR>', {silent=true})
  map('v', '<F3>', ':MaximizerToggle<CR>', {silent=true})
  map('i', '<F3>', '<C-o>:MaximizerToggle<CR>', {silent=true})

  -- neotermm
  map('t', '<c-w>', '<c-\\><c-n><c-w>', {noremap=true})

  -- Toggle to disable mouse mode and indentlines for easier paste
  ToggleMouse = function()
    if vim.o.mouse == 'a' then
      vim.cmd[[IndentBlanklineDisable]]
      vim.wo.signcolumn='no'
      vim.o.mouse = 'v'
      vim.wo.number = false
      vim.wo.relativenumber = false
      print("Mouse disabled")
    else
      vim.cmd[[IndentBlanklineEnable]]
      vim.wo.signcolumn='yes'
      vim.o.mouse = 'a'
      vim.wo.number = true
      print("Mouse enabled")
    end
  end

  vim.api.nvim_set_keymap('n', '<F10>', '<cmd>lua ToggleMouse()<cr>', { noremap = true, desc = "Toggle mouse for paste" })
end

M.lsp_setup = function(client, bufnr)

  local keymap = {}

  local opts = { noremap = true, silent = true, buffer = bufnr }

  keymap.c = { name = "+Code Actions", }
  keymap.c.l = { name = "+LSP Actions"}
  keymap.x = { name = "+LSP Diagnostics"}

  if client.name == "typescript" then
    map("n", "<leader>co", "<cmd>:TSLspOrganize<CR>", opts, "Typescript: Organize imports")
    map("n", "<leader>cR", "<cmd>:TSLspRenameFile<CR>", opts, "Typescript: Rename file")
  end

  if client.name == "rust_analyzer" then
    map("n", "<leader>co", require('rust-tools').hover_actions.hover_actions, opts, "Rust: show hover actions")
  end

  map("n", "<c-f>", function()
    if not require("noice.lsp").scroll(4) then
      return "<c-f>"
    end
  end, opts, "Scroll down")

  map("n", "<c-b>", function()
    if not require("noice.lsp").scroll(-4) then
      return "<c-b>"
    end
  end, opts, "Scroll up")

  local visual_keymap = {}
  visual_keymap.c = { name = "+Code Actions" }
  map("v", "<leader>ca", ":<C-U>lua vim.lsp.buf.code_action()<CR>", opts)

  local goto_keymap = {}
  goto_keymap.g = { name = "+goto" }
  -- Set some keybinds conditional on server capabilities
  if client.server_capabilities.documentFormattingProvider then
    map("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts, "Format document (lsp)")
  elseif client.server_capabilities.documentRangeFormattingProvider then
    map("v", "<leader>cf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  wk.register(keymap, { buffer = bufnr, prefix = "<leader>" })
  wk.register(visual_keymap, { buffer = bufnr, prefix = "<leader>", mode = "v" })
  wk.register(goto_keymap, { buffer = bufnr, prefix = "g" })

end

M.setup_ft_mappings = function()

  augroup("globalftmaps", {
      {'FileType', 'markdown', 'lua registerMappingsMD()'},
      {'FileType', 'gitcommit', 'lua registerMappingsCommitMsg()'},
    }
  )

  _G.registerMappingsCommitMsg = function()
    local buf = vim.api.nvim_get_current_buf()
    map("n", "ga", "<cmd>lua require('telescope').extensions.githubcoauthors.coauthors()<CR>", { buffer = buf, desc = "Github Co-authors"} )
  end

  _G.registerMappingsMD = function()
    local buf = vim.api.nvim_get_current_buf()
    map("n", "<C-S>p", "<cmd>MarkdownPreview<cr>", { buffer = buf })
  end

end

return M
