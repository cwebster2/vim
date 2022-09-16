local map = require("cwebster.utils").map
local augroup = require("cwebster.utils").augroup
local wk = require("which-key")

local M = {}


M.init_keymap = function()
  local leader_map = {}
  -- <leader>g -- git stuff

  leader_map.g = { name = "+git" }
  map("n", "<leader>gg", function() require("neogit").open() end, { desc = "Neogit" }, "git", "git_neogit")
  map("n", "<leader>gc", "<Cmd>Telescope git_commits<CR>", { desc = "Show git commits" }, "git", "telescope_git_commits")
  map("n", "<leader>gb", "<Cmd>Telescope git_branches<CR>", { desc = "Show git branches" },"git", "telescope_git_branches" )
  map("n", "<leader>gs", "<Cmd>Telescope git_status<CR>", { desc = "Show git status" }, "git", "telescope_git_status" )
  map("n", "<leader>gi", function() require('telescope').extensions.gh.issues() end, { desc = "Show gh issues" }, "github", "github_issues")
  map("n", "<leader>gp", function() require('telescope').extensions.gh.pull_request() end, { desc = "Show gh pr" }, "github", "github_prs" )
      --l = { function() require"util".float_terminal("lazygit") end, "LazyGit" },
      --["d"] = { "<cmd>DiffviewOpen<cr>", "DiffView" },

  -- <leader>b and bufferline stuff

  leader_map.b = { name = "+buffer" }
  map("n", "<leader>bg", "<cmd>BufferLinePick<cr>", { desc = "Goto Buffer"}, "buffer", "bufferline_pick")
  map("n", "<leader>bp", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Previous Buffer"}, "buffer", "bufferline_cycle_prev")
  map("n", "<leader>bn", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer"}, "buffer", "bufferline_cycle_next")
  map("n", "<leader>bd", '<Cmd>BufferLineSortByDirectory<CR>', { desc = "Order by Dir"}, "buffer", "bufferline_sort_dir")
  map("n", "<leader>bl", '<Cmd>BufferLineSortByDirectory<CR>', { desc = "Order by Lang"}, "buffer", "bufferline_sort_lang")
  map("n", "<leader>m", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Previous Buffer"})
  map("n", "<leader>i", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer"})

  map("n", "<leader>bs", function() require('telescope.builtin').buffers() end, { desc =  "Buffers"}, "buffer", "changeme", "telescope_buffers")
  map("n", "<leader>bb", '<cmd>e#<CR>', { desc = "Last Buffer"}, "buffer", "buffer_last_buf")
  map("n", "<leader>bv", function() require("cwebster.utils").scratchBuffer("vsplit") end, { desc = "Scrach buffer in vert split"}, "buffer", "scratch_buffer")

  -- <leader>h -- help

  leader_map.h = { name = "+help" }
  map("n", "<leader>hk", "<Cmd>Telescope mapper<CR>", { desc = "Find keymaps"}, "help", "telescope_mapper")
  map("n", "<leader>ht", "<cmd>Telescope builtin<cr>", { desc = "Telescope"}, "help", "telescope_builtins")
  map("n", "<leader>hc", "<cmd>Telescope commands<cr>", { desc = "Commands"}, "help", "telescope_commands")
  map("n", "<leader>hh", "<cmd>Telescope help_tags<cr>", { desc = "Help Pages"}, "help", "telescope_help")
  map("n", "<leader>hm", "<cmd>Telescope man_pages<cr>", { desc = "Man Pages"}, "help", "telescope_man")
  -- map("n", "<leader>hk", "<cmd>Telescope keymaps<cr>", { desc = "Key Maps"}, "help", "telescope_keymaps_all")
  map("n", "<leader>hs", "<cmd>Telescope highlights<cr>", { desc = "Search Highlight Groups"}, "help", "telescope_highlight")
  map("n", "<leader>hl", "<cmd>TSHighlightCapturesUnderCursor<cr>", { desc = "Highlight Groups at cursor"}, "help", "telescope_get_high")
  map("n", "<leader>hf", "<cmd>Telescope filetypes<cr>", { desc = "File Types"}, "help", "telescope_filetype")
  map("n", "<leader>ho", "<cmd>Telescope vim_options<cr>", { desc = "Options"}, "help", "telescope_opts")
  map("n", "<leader>ha", "<cmd>Telescope autocommands<cr>", { desc = "Auto Commands"}, "help", "telescope_aucmd")
  map("n", "<leader>hi", "<cmd>echo \"hi<\" . synIDattr(synID(line(\".\"),col(\".\"),1),\"name\") . '> trans<' . synIDattr(synID(line(\".\"),col(\".\"),0),\"name\") . \"> lo<\" . synIDattr(synIDtrans(synID(line(\".\"),col(\".\"),1)),\"name\") . \">\"<CR> ", { desc = "Highlight Under Cursos"}, "help", "get_high_under_cursor")

  -- <leader>hp -- packer
  --
  leader_map.h.p = { name = "+packer" }
  map("n", "<leader>hpp", "<cmd>PackerSync<cr>", { desc = "Sync"}, "packer", "packer_sync")
  map("n", "<leader>hps", "<cmd>PackerStatus<cr>", { desc = "Status"}, "packer", "packer_status")
  map("n", "<leader>hpi", "<cmd>PackerInstall<cr>", { desc = "Install"}, "packer", "packer_install")
  map("n", "<leader>hpc", "<cmd>PackerCompile<cr>", { desc = "Compile"}, "packer", "packer_compile")

  -- <leader>f -- file finders
  --
  leader_map.f = { name = "+find" }
  map("n", "<leader>ft", "<cmd>Neotree show<cr>", { desc = "NeoTree"}, "files", "neotree_show")
  map("n", "<leader>fs", ":SymbolsOutline<CR>", { desc = "Symbols"}, "files", "symboltree_show")
  map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>", { desc = "Find Files"}, "files", "telescope_find_files")
  map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').git_files()<CR>", { desc = "Find Git Files"}, "files", "telescope_git_files")
  map("n", "<leader>fr", "<cmd>lua require('telescope.builtin').oldfiles()<CR>", { desc = "Recent Files"}, "files", "telescope_recent_files")
  map("n", "<leader>fn", "<cmd>enew<CR>", { desc = "New File" })


  -- leader s -- searching
  leader_map.s = { name = "+search" }
  map("n", "<leader>sg", "<cmd>lua require('telescope.builtin').live_grep()<CR>", { desc = "Grep"}, "search", "search_livegrep")
  map("n", "<leader>sc", '<cmd>let @/=""<cr>', { desc = "Clear search highlight"}, "search", "search_clear_high")
  map("n", "<leader>sl", "<cmd>lua require('telescope.builtin').loclist()<CR>", { desc = "Loclist"}, "search", "search_loclist")
  map("n", "<leader>sq", "<cmd>lua require('telescope.builtin').quickfix()<CR>",{ desc = "Quickfix"}, "search", "search_qflist")
  map("n", "<leader>ss", "<cmd>lua require('telescope.builtin').spell_suggest()<CR>", { desc = "Spelling"}, "search", "spelling_suggest")

  -- leader x -- trouble
  leader_map.x = { name = "+trouble" }
  map("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { desc = "Trouble"}, "Trouble", "trouble_toggle")
  map("n", "<leader>xw", "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", { desc = "lsp workspace"}, "Trouble", "trouble_workspace_diag")
  map("n", "<leader>xd", "<cmd>TroubleToggle lsp_document_diagostics<cr>", { desc = "lsp document"}, "Trouble", "trouble_document_diag")
  map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { desc = "quickfix"}, "Trouble", "trouble_qflist")
  map("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { desc = "loclist"}, "Trouble", "trouble_loclist")

  -- leader t -- testing
  leader_map.t = { name = "+testing" }
  map("n", "<leader>tr", "<Plug>RestNvim<CR>", { desc = "REST request", noremap = true}, "http", "rest_http_req")
  map("n", "<leader>tt", "<cmd>TestNearest<CR>", { desc = "Nearest"}, "test", "test_nearest")
  map("n", "<leader>tf", "<cmd>TestFile<CR>", { desc = "File"}, "test", "test_file")
  map("n", "<leader>ts", "<cmd>TestSuite<CR>", { desc = "Suite"}, "test", "test_suite")
  map("n", "<leader>t_", "<cmd>TestLast<CR>", { desc = "Last"}, "test", "test_last")

  -- leader d --debug stuff

  leader_map.d = { name = "+debug" }
  map("n", "<leader>dh", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Breakpoint"}, "debug", "dap_toggle_bp")
  map("n", "<leader>ds", "<cmd>lua require'dap'.close()<CR>", { desc = "Stop"}, "debug", "dap_close")
  map("n", "<leader>dn", "<cmd>lua require'dap'.continue()<CR>", { desc = "Cont"}, "debug", "dap_cont")
  map("n", "<leader>dk", "<cmd>lua require'dap'.up()<CR>", { desc = "Up"}, "debug", "dap_up")
  map("n", "<leader>dj", "<cmd>lua require'dap'.down()<CR>", { desc = "Down"}, "debug", "dap_down")
  map("n", "<leader>d_", "<cmd>lua require'dap'.disconnect();require'dap'.stop();require'dap'.run_last()<CR>", { desc = "Disco"}, "debug", "dap_disco")
  map("n", "<leader>dr", "<cmd>lua require'dap'.repl.open({}, 'vsplit')<CR><C-w>l", { desc = "REPL"}, "debug", "dap_repl_open")
      -- ["i"] = { "<cmd>lua require'dap.ui.variables'.hover()<CR>", "" },
      -- ["?"] = { "<cmd>lua require'dap.ui.variables'.scopes()<CR>", "" },
  map("n", "<leader>de", "<cmd>lua require'dap'.set_exception_breakpoints({'all'})<CR>", { desc = "Enable BPs"}, "debug", "dap_set_exp_bp")
  map("n", "<leader>da", "<cmd>lua require'debugHelper'.attach()<CR>", { desc = "Attack"}, "debug", "dap_attach")
  map("n", "<leader>dA", "<cmd>lua require'debugHelper'.attachToRemote()<CR>", { desc = "Att Remote"}, "debug", "dap_attach_remote")
  map("n", "<leader>di", "<cmd>lua require'dap.ui.widgets'.hover()<CR>", { desc = "UI"}, "debug", "dap_ui_hover")
  map("n", "<leader>d?", "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>", { desc = "Scopes"}, "debug", "dap_widgets")
  map("n", "<leader>df", "<cmd>Telescope dap frames<CR>", { desc = "Frames"}, "debug", "tele_dap_frames")
  map("n", "<leader>dc", "<cmd>Telescope dap commands<CR>", { desc = "Commands"}, "debug", "tele_dap_commands")
  map("n", "<leader>db", "<cmd>Telescope dap list_breakpoints<CR>", { desc = "List BPs"}, "debug", "tele_dap_bps")



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
  map("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts, "Lsp", "lsp_buf_rename", "Rename symbol")
  map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts, "Lsp", "lsp_code_action", "Buffer code actions")
  map("n", "<leader>cd", "<cmd>lua vim.diagnostic.open_float(nil,{source=always,focusable=false,border='rounded'})<CR>", opts, "Lsp", "lsp_diag_float", "Open floating diagnostic window")
  keymap.c.l = { name = "+LSP Actions"}
  map("n", "<leader>cli", "<cmd>LspInfo<cr>", opts, "Lsp", "lsp_info", "Show LSP information")
  map("n", "<leader>cla", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts, "Lsp", "lsp_buf_add_wksp", "Add workspace folder")
  map("n", "<leader>clr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts, "Lsp", "lsp_buf_rmv_wksp", "Remove workspace folder")
  map("n", "<leader>cll", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts, "Lsp", "list_wkspc_folder", "List workspace folders")

  keymap.x = { name = "+LSP Diagnostics"}
  map("n", "<leader>xs", "<cmd>Telescope lsp_document_diagnostics<cr>", opts, "Lsp", "lsp_doc_diag", "Open document diagnostics in telescope")
  map("n", "<leader>xW", "<cmd>Telescope lsp_workspace_diagnostics<cr>", opts, "Lsp", "lsp_wksp_diag", "Open workspace diagnostics in telescope")

  if client.name == "typescript" then
    map("n", "<leader>co", "<cmd>:TSLspOrganize<CR>", opts, "Lsp", "ts_lsp_org", "Typescript: Organize imports")
    map("n", "<leader>cR", "<cmd>:TSLspRenameFile<CR>", opts, "Lsp", "ts_lsp_rename_file", "Typescript: Rename file")
  end

  if client.name == "rust_analyzer" then
    map("n", "<leader>co", require('rust-tools').hover_actions.hover_actions, opts, "Lsp", "rust_lsp_hover", "Rust: show hover actions")
  end

  local visual_keymap = {}
  visual_keymap.c = { name = "+Code Actions" }
  map("v", "<leader>ca", ":<C-U>lua vim.lsp.buf.code_action()<CR>", opts)

  local goto_keymap = {}
  goto_keymap.g = { name = "+goto" }
  map("n", "gr", "<cmd>Telescope lsp_references<cr>", opts, "Lsp", "lsp_refs_tele", "Show lsp references in telescope")
  map("n", "gR", "<cmd>Trouble lsp_references<cr>", opts, "Lsp", "lsp_refs_trouble", "Show lsp references in trouble")
  map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts, "Lsp", "lsp_buf_decl", "Show lsp declarations")
  map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts, "Lsp", "lsp_buf_def", "Show lsp definition")
  map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts, "Lsp", "lsp_buf_sighlp", "Show lsp signature help")
  map("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts, "Lsp", "lsp_buf_impl", "Show lsp implementation")
  map("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts, "Lsp", "lsp_buf_typedef", "Show lsp buffer declarations")
  map("n", "gk", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts, "Lsp", "lsp_buf_hover", "Show lsp buffer hover actions")
  map("n", "gh", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", opts, "Lsp", "lsp_symbols_tele", "Show lsp symbols in telescope")

  map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts, "Lsp", "lsp_buf_hoverK", "Show lsp buffer hover actions")
  map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev({popup_opts={focusable=false,border='rounded'}})<CR>", opts, "Lsp", "lsp_buf_diag_p", "Prev diagnostic")
  map("n", "]d", "<cmd>lua vim.diagnostic.goto_next({popup_opts={focusable=false,border='rounded'}})<CR>", opts, "Lsp", "lsp_buf_diag_n", "Next diagnostic")
  map("i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

  -- Set some keybinds conditional on server capabilities
  if client.server_capabilities.documentFormattingProvider then
    map("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts, "Lsp", "lsp_doc_fmt", "Format document (lsp)")
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
