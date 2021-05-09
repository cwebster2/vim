local map = require("utils").map
local wk = require("which-key")

-- visual mode indent keep selection
map('v', '<', '<gv', {noremap=true})
map('v', '>', '>gv', {noremap=true})
map('v', '.', ':normal .<CR>', {noremap=true})

wk.register({
    g = {
      name = "+git",
      w = { ":Gwrite<cr>", "Git Write" },
      s = { ":vertical Gstatus<cr>", "Fugitive" },
      c = { ":Git commit<cr>", "Commit" },
      p = { ":Git push", "Push" },
    }
  }, { prefix = "<leader>" })

-- move between splits
--map('n', '<C-m>', '<C-w><C-h>', {noremap=true})
--map('n', '<C-n>', '<C-w><C-j>', {noremap=true})
--map('n', '<C-e>', '<C-w><C-k>', {noremap=true})
--map('n', '<C-i>', '<C-w><C-l>', {noremap=true})

-- map("n", "<leader>m", "<Cmd>BufferLineCycleNext<CR>", {silent=true,noremap=true})
-- map("n", "<leader>i", "<Cmd>BufferLineCyclePrev<CR>", {silent=true,noremap=true})
-- map("n", "<leader>gb", "<Cmd>BufferLinePick<CR>", {noremap=true})

map("n", "<leader>m", "<Cmd>BufferPrevious<CR>", {silent=true,noremap=true})
map("n", "<leader>i", "<Cmd>BufferNext<CR>", {silent=true,noremap=true})
map("n", "<leader>gb", "<Cmd>BufferPick<CR>", {noremap=true})

-- visual line movement
map('', 'j', '(v:count == 0 ? \'gj\' : \'j\')', {expr=true,noremap=true,silent=true})
map('', '<Down>', '(v:count == 0 ? \'gj\' : \'<Down>\')', {expr=true,noremap=true,silent=true})
map('', 'k', '(v:count == 0 ? \'gk\' : \'k\')', {expr=true,noremap=true,silent=true})
map('', '<Up>', '(v:count == 0 ? \'gk\' : \'<Up>\')', {expr=true,noremap=true,silent=true})

-- quick spilt
map('n', '<Leader>v', '<C-w>v<C-w>w', {})

-- clear search
map('n', '<Leader>/', ':let @/=""<CR>', {silent=true})

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

-- swap to last buffer
map('n', '<Leader>b', ':e#<CR>', {noremap=true})

-- vista
map('n', '<Leader>tb', ':SymbolsOutline<CR>', {silent=true})

-- maximizer
map('n', '<F3>', ':MaximizerToggle<CR>', {silent=true})
map('v', '<F3>', ':MaximizerToggle<CR>', {silent=true})
map('i', '<F3>', '<C-o>:MaximizerToggle<CR>', {silent=true})

-- neotermm
map('n', '<c-q>', ':Ttoggle<CR>', {noremap=true})
map('i', '<c-q>', '<esc>:Ttoggle<CR>', {noremap=true})
map('t', '<c-q>', '<c-\\><c-n>:Ttoggle<CR>', {noremap=true})

-- nvim tree
map('n', '<Leader>E', ':NvimTreeToggle<CR>', {noremap=true})
--nnoremap <leader>r :NvimTreeRefresh<CR>
map('n', '<Leader>e', ':NvimTreeFindFile<CR>', {noremap=true})
-- NvimTreeOpen and NvimTreeClose are also available if you need them

-- telescope
map('n', '<Leader>ff', "<cmd>lua require('telescope.builtin').git_files()<CR>", {noremap=true})
map('n', '<Leader>fp', "<cmd>lua require('telescope.builtin').find_files()<CR>", {noremap=true})
map('n', '<Leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<CR>", {noremap=true})
map('n', '<Leader>fb', "<cmd>lua require('telescope.builtin').buffers()<CR>", {noremap=true})
map('n', '<Leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<CR>", {noremap=true})
map('n', '<Leader>fl', "<cmd>lua require('telescope.builtin').loclist()<CR>", {noremap=true})
map('n', '<Leader>fq', "<cmd>lua require('telescope.builtin').quickfix()<CR>", {noremap=true})
map('n', '<Leader>fc', "<cmd>lua require('telescope.builtin').commands()<CR>", {noremap=true})
map('n', '<Leader>fs', "<cmd>lua require('telescope.builtin').spell_suggest()<CR>", {noremap=true})
map('n', '<Leader>fo', "<cmd>lua require('telescope.builtin').highlights()<CR>", {noremap=true})
--map('n', '<Leader>fo', "<cmd>lua require('telescope.builtin').colorscheme()<CR>", {noremap=true})
map('n', '<Leader>ghi', "<cmd>lua require('telescope').extensions.gh.issues()<CR>", {noremap=true})
map('n', '<Leader>gpr', "<cmd>lua require('telescope').extensions.gh.pull_request()<CR>", {noremap=true})

-- testing
map('n', '<Leader>tt', "<cmd>TestNearest<CR>", {noremap=true})
map('n', '<Leader>tf', "<cmd>TestFile<CR>", {noremap=true})
map('n', '<Leader>ts', "<cmd>TestSuite<CR>", {noremap=true})
map('n', '<Leader>t_', "<cmd>TestLast<CR>", {noremap=true})

-- barbar
map('n', '<C-s>', '<Cmd>BufferPick<CR>', {noremap=true, silent=true})
map('n', '<Leader>bd', '<Cmd>BufferOrderByDirectory<CR>', {noremap=true, silent=true})
map('n', '<Leader>bl', '<Cmd>BufferOrderByLanguage<CR>', {noremap=true, silent=true})

-- trouble
map('n', '<leader>xx', '<cmd>LspTroubleToggle<cr>', {noremap=true})
map('n', '<leader>xw', '<cmd>LspTroubleToggle lsp_workspace_diagnostics<cr>', {noremap=true})
map('n', '<leader>xd', '<cmd>LspTroubleToggle lsp_document_diagostics<cr>', {noremap=true})
map('n', '<leader>xq', '<cmd>LspTroubleToggle quickfix<cr>', {noremap=true})
map('n', '<leader>xl', '<cmd>LspTroubleToggle loclist<cr>', {noremap=true})
