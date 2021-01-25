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

-- maximizer
map('n', '<F3>', ':MaximizerToggle<CR>', {silent=true})
map('v', '<F3>', ':MaximizerToggle<CR>', {silent=true})
map('i', '<F3>', '<C-o>:MaximizerToggle<CR>', {silent=true})

-- neotermm
map('n', '<c-q>', ':Ttoggle<CR>', {noremap=true})
map('i', '<c-q>', '<esc>:Ttoggle<CR>', {noremap=true})
map('t', '<c-q>', '<c-\\><c-n>:Ttoggle<CR>', {noremap=true})

map('n', '<Leader>a', ':Neoformat prettier<CR>', {noremap=true})

map('n', '<C-p>', "<cmd>lua require('telescope.builtin').git_files()<CR>", {noremap=true})
map('n', 'ff', "<cmd>lua require('telescope.builtin').find_files()<CR>", {noremap=true})
map('n', 'fg', "<cmd>lua require('telescope.builtin').live_grep()<CR>", {noremap=true})
map('n', 'fb', "<cmd>lua require('telescope.builtin').buffers()<CR>", {noremap=true})
map('n', 'fh', "<cmd>lua require('telescope.builtin').help_tags()<CR>", {noremap=true})
map('n', 'fl', "<cmd>lua require('telescope.builtin').loclist()<CR>", {noremap=true})
map('n', 'fq', "<cmd>lua require('telescope.builtin').quickfix()<CR>", {noremap=true})
map('n', 'fc', "<cmd>lua require('telescope.builtin').commands()<CR>", {noremap=true})

