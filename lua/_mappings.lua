local map = require("utils").map

-- visual mode indent keep selection
map('v', '<', '<gv', {noremap=true})
map('v', '>', '>gv', {noremap=true})
map('v', '.', ':normal .<CR>', {noremap=true})

-- fugitive
map('n', '<Leader>gw', ':Gwrite<CR>', {silent=true})
map('n', '<Leader>gs', ':Gstatus<CR>', {silent=true})
map('n', '<Leader>gc', ':Gcommit<CR>', {silent=true})
map('n', '<Leader>gp', ':Gpush<CR>', {silent=true})

-- move between splits
map('n', '<C-m>', '<C-w><C-h>', {noremap=true})
map('n', '<C-n>', '<C-w><C-j>', {noremap=true})
map('n', '<C-e>', '<C-w><C-k>', {noremap=true})
map('n', '<C-i>', '<C-w><C-l>', {noremap=true})

--map("n", "<leader>m", "<Cmd>BufferLineCycleNext<CR>", {silent=true,noremap=true})
--map("n", "<leader>i", "<Cmd>BufferLineCyclePrev<CR>", {silent=true,noremap=true})
--map("n", "<leader>gb", "<Cmd>BufferLinePick<CR>", {noremap=true})
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
map('n', '<Leader>ln', ':lnext<cr>', {})
map('n', '<Leader>lp', ':lprev<cr>', {})
map('n', '<Leader>lc', ':lclose<cr>', {})

-- swap to last buffer
map('n', '<Leader>b', ':e#<CR>', {noremap=true})

-- vista
map('n', '<Leader>tb', ':Vista!!<CR>', {silent=true})

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
map('n', '<Leader>fp', "<cmd>lua require('telescope.builtin').git_files()<CR>", {noremap=true})
map('n', '<Leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>", {noremap=true})
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
