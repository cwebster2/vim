local map = require("utils").map
local wk = require("which-key")

-- visual mode indent keep selection
map('v', '<', '<gv', {noremap=true})
map('v', '>', '>gv', {noremap=true})
map('v', '.', ':normal .<CR>', {noremap=true})

local leader_map = {
  ["g"] = {
    name = "+git",
    ["g"] = { ":vertical Gstatus<cr>", "Fugitive" },
    ["w"] = { ":Gwrite<cr>", "Git Write" },
    --["c"] = { ":Git commit<cr>", "Commit" },
    --["p"] = { ":Git push", "Push" },
    --l = { function() require"util".float_terminal("lazygit") end, "LazyGit" },
    ["c"] = { "<Cmd>Telescope git_commits<CR>", "commits" },
    ["b"] = { "<Cmd>Telescope git_branches<CR>", "branches" },
    ["s"] = { "<Cmd>Telescope git_status<CR>", "status" },
    --["d"] = { "<cmd>DiffviewOpen<cr>", "DiffView" },
    --h = { name = "+hunk" }
    ["i"] = { "<cmd>lua require('telescope').extensions.gh.issues()<CR>", "issues" },
    ["p"] = { "<cmd>lua require('telescope').extensions.gh.pull_request()<CR>", "pull requests" },
  },
  ["b"] = {
    name = "+buffer",
    ["g"] = { "<cmd>BufferPick<cr>", "Goto Buffer" },
    ["p"] = { "<Cmd>BufferPrevious<CR>", "Previous Buffer" },
    ["n"] = { "<Cmd>BufferNext<CR>", "Next Buffer" },
    ["s"] = { "<cmd>lua require('telescope.builtin').buffers()<CR>", "Buffers" },
    ["b"] = { ':e#<CR>', "Last Buffer"},
    ["d"] = { '<Cmd>BufferOrderByDirectory<CR>', "Order by Dir" },
    ["l"] = { '<Cmd>BufferOrderByLanguage<CR>', "Order by Lang" },
  },
  ["h"] = {
    name = "+help",
    ["t"] = { "<cmd>Telescope builtin<cr>", "Telescope" },
    ["c"] = { "<cmd>Telescope commands<cr>", "Commands" },
    ["h"] = { "<cmd>Telescope help_tags<cr>", "Help Pages" },
    ["m"] = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    ["k"] = { "<cmd>Telescope keymaps<cr>", "Key Maps" },
    ["s"] = { "<cmd>Telescope highlights<cr>", "Search Highlight Groups" },
    --["l = { [[<cmd>TSHighlightCapturesUnderCursor<cr>]], "Highlight Groups at cursor" },
    ["f"] = { "<cmd>Telescope filetypes<cr>", "File Types" },
    ["o"] = { "<cmd>Telescope vim_options<cr>", "Options" },
    ["a"] = { "<cmd>Telescope autocommands<cr>", "Auto Commands" },
    ["p"] = {
      name = "+packer",
      ["p"] = { "<cmd>PackerSync<cr>", "Sync" },
      ["s"] = { "<cmd>PackerStatus<cr>", "Status" },
      ["i"] = { "<cmd>PackerInstall<cr>", "Install" },
      ["c"] = { "<cmd>PackerCompile<cr>", "Compile" }
    }
  },
  ["f"] = {
    name = "+file",
    ["t"] = { "<cmd>NvimTreeToggle<cr>", "NvimTree" },
    ["f"] = { "<cmd>lua require('telescope.builtin').find_files()<CR>", "Find Files" },
    ["g"] = { "<cmd>lua require('telescope.builtin').git_files()<CR>", "Find Git Files" },
    ["r"] = { "<cmd>lua require('telescope.builtin').oldfiles()<CR>", "Recent Files" },
    ["n"] = { "<cmd>enew<CR>", "New File" },
  },
  ["s"] = {
    name = "+search",
    ["g"] = { "<cmd>lua require('telescope.builtin').live_grep()<CR>", "Grep" },
    ["c"] = { '<cmd>let @/=""<cr>', "Clear search highlight" },
    ["l"] = { "<cmd>lua require('telescope.builtin').loclist()<CR>", "Loclist" },
    ["q"] = { "<cmd>lua require('telescope.builtin').quickfix()<CR>","Quickfix" },
    ["s"] = { "<cmd>lua require('telescope.builtin').spell_suggest()<CR>", "Spelling" },
  },
  ["m"] = { "<Cmd>BufferPrevious<CR>", "Previous Buffer" },
  ["i"] = { "<Cmd>BufferNext<CR>", "Next Buffer" },
}

local normal_map = {
  ["g"] = {
    name = "+goto",
  },
  ["<C-_>"] = { "<cmd>CommentToggle<cr>", "Comment Line" },
  ["<C-s>"] = { "<Cmd>BufferPick<CR>", "Pick Buffer" },
  --["<C-p>"] = { "<Cmd>FGFiles<CR>", "Git Files" },
}

local visual_map = {
  ["<C-_>"] = { ":'<,'>CommentToggle<cr>", "Comment Lines" }
}

wk.register(leader_map, { prefix = "<leader>" })
wk.register(normal_map)
wk.register(visual_map, { mode = "v" })

--map('n', '<Leader>fo', "<cmd>lua require('telescope.builtin').colorscheme()<CR>", {noremap=true})

-- move between splits
--map('n', '<C-m>', '<C-w><C-h>', {noremap=true})
--map('n', '<C-n>', '<C-w><C-j>', {noremap=true})
--map('n', '<C-e>', '<C-w><C-k>', {noremap=true})
--map('n', '<C-i>', '<C-w><C-l>', {noremap=true})

-- visual line movement
map('', 'j', '(v:count == 0 ? \'gj\' : \'j\')', {expr=true,noremap=true,silent=true})
map('', '<Down>', '(v:count == 0 ? \'gj\' : \'<Down>\')', {expr=true,noremap=true,silent=true})
map('', 'k', '(v:count == 0 ? \'gk\' : \'k\')', {expr=true,noremap=true,silent=true})
map('', '<Up>', '(v:count == 0 ? \'gk\' : \'<Up>\')', {expr=true,noremap=true,silent=true})

-- quick spilt
map('n', '<Leader>v', '<C-w>v<C-w>w', {})

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

-- testing
map('n', '<Leader>tt', "<cmd>TestNearest<CR>", {noremap=true})
map('n', '<Leader>tf', "<cmd>TestFile<CR>", {noremap=true})
map('n', '<Leader>ts', "<cmd>TestSuite<CR>", {noremap=true})
map('n', '<Leader>t_', "<cmd>TestLast<CR>", {noremap=true})

-- trouble
map('n', '<leader>xx', '<cmd>LspTroubleToggle<cr>', {noremap=true})
map('n', '<leader>xw', '<cmd>LspTroubleToggle lsp_workspace_diagnostics<cr>', {noremap=true})
map('n', '<leader>xd', '<cmd>LspTroubleToggle lsp_document_diagostics<cr>', {noremap=true})
map('n', '<leader>xq', '<cmd>LspTroubleToggle quickfix<cr>', {noremap=true})
map('n', '<leader>xl', '<cmd>LspTroubleToggle loclist<cr>', {noremap=true})
