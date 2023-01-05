local map = require("cwebster.utils").map
local augroup = require("cwebster.utils").augroup
local wk = require("which-key")

local M = {}


M.init_keymap = function()
  local leader_map = {}
  -- <leader>g -- git stuff

  leader_map.g = { name = "+git" }
  leader_map.g.h = { name = "+hunks" }

  leader_map.b = { name = "+buffer" }
  leader_map.h = { name = "+help" }
  leader_map.h.p = { name = "+packer" }
  map("n", "<leader>hpp", "<cmd>PackerSync<cr>", { desc = "Sync"})
  map("n", "<leader>hps", "<cmd>PackerStatus<cr>", { desc = "Status"})
  map("n", "<leader>hpi", "<cmd>PackerInstall<cr>", { desc = "Install"})
  map("n", "<leader>hpc", "<cmd>PackerCompile<cr>", { desc = "Compile"})

  -- <leader>f -- file finders
  --
  leader_map.f = { name = "+find" }
  leader_map.s = { name = "+search" }
  leader_map.x = { name = "+trouble" }
  leader_map.t = { name = "+testing" }

  -- leader d --debug stuff

  leader_map.d = { name = "+debug" }

  map("n", "<leader>z", function()
      require("notify").dismiss()
      vim.cmd.noh()
    end, { desc = "Clear hightlights and notifications"})

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

  local normal_map = {
    ["g"] = {
      name = "+goto",
      ["z"] = {
        name = "+zettle",
        n = { "New" },
        z = { "Find/create" },
        Z = { "Insert ID" },
        b = { "Backlinks" },
        B = { "Id of backlink" },
        t = { "Find/insert tags" },
        s = { "Start server" },
        ["]"] = { "Next Link" },
        ["["] = { "Prev Link" },
      },
    },
  }

  wk.register(leader_map, { prefix = "<leader>" })
  wk.register(normal_map)

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
  map("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts, "Rename symbol")
  map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts, "Buffer code actions")
  map("n", "<leader>cd", "<cmd>lua vim.diagnostic.open_float(nil,{source=always,focusable=false,border='rounded'})<CR>", opts, "Open floating diagnostic window")
  keymap.c.l = { name = "+LSP Actions"}
  map("n", "<leader>cli", "<cmd>LspInfo<cr>", opts, "Show LSP information")
  map("n", "<leader>cla", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts, "Add workspace folder")
  map("n", "<leader>clr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts, "Remove workspace folder")
  map("n", "<leader>cll", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts, "List workspace folders")

  keymap.x = { name = "+LSP Diagnostics"}
  map("n", "<leader>xs", "<cmd>Telescope lsp_document_diagnostics<cr>", opts, "Open document diagnostics in telescope")
  map("n", "<leader>xW", "<cmd>Telescope lsp_workspace_diagnostics<cr>", opts, "Open workspace diagnostics in telescope")

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
  map("n", "gr", "<cmd>Telescope lsp_references<cr>", opts, "Show lsp references in telescope")
  map("n", "gR", "<cmd>Trouble lsp_references<cr>", opts, "Show lsp references in trouble")
  map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts, "Show lsp declarations")
  map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts, "Show lsp definition")
  map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts, "Show lsp signature help")
  map("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts, "Show lsp implementation")
  map("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts, "Show lsp buffer declarations")
  map("n", "gk", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts, "Show lsp buffer hover actions")
  map("n", "gh", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", opts, "Show lsp symbols in telescope")

  map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts, "Show lsp buffer hover actions")
  map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev({popup_opts={focusable=false,border='rounded'}})<CR>", opts, "Prev diagnostic")
  map("n", "]d", "<cmd>lua vim.diagnostic.goto_next({popup_opts={focusable=false,border='rounded'}})<CR>", opts, "Next diagnostic")
  map("i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

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
