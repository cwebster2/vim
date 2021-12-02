local map = require("cwebster.utils").map
local augroup = require("cwebster.utils").augroup

local M = {}

M.init_keymap = function()
  local wk = require("which-key")

  local leader_map = {
    ["g"] = {
      name = "+git",
      -- ["g"] = { ":vertical Gstatus<cr>", "Fugitive" },
      ["g"] = { "<cmd>lua require('neogit').open()<cr>", "Neogit" },
      ["w"] = { ":Gwrite<cr>", "Git Write" },
      --l = { function() require"util".float_terminal("lazygit") end, "LazyGit" },
      ["c"] = { "<Cmd>Telescope git_commits<CR>", "commits" },
      ["b"] = { "<Cmd>Telescope git_branches<CR>", "branches" },
      ["s"] = { "<Cmd>Telescope git_status<CR>", "status" },
      --["d"] = { "<cmd>DiffviewOpen<cr>", "DiffView" },
      ["h"] = { name = "+hunk" },
      ["i"] = { "<cmd>lua require('telescope').extensions.gh.issues()<CR>", "issues" },
      ["p"] = { "<cmd>lua require('telescope').extensions.gh.pull_request()<CR>", "pull requests" },
    },
    ["b"] = {
      name = "+buffer",
      ["g"] = { "<cmd>BufferLinePick<cr>", "Goto Buffer" },
      ["p"] = { "<Cmd>BufferLineCyclePrev<CR>", "Previous Buffer" },
      ["n"] = { "<Cmd>BufferLineCycleNext<CR>", "Next Buffer" },
      ["s"] = { "<cmd>lua require('telescope.builtin').buffers()<CR>", "Buffers" },
      ["b"] = { ':e#<CR>', "Last Buffer"},
      ["d"] = { '<Cmd>BufferLineSortByDirectory<CR>', "Order by Dir" },
      ["l"] = { '<Cmd>BufferLineSortByDirectory<CR>', "Order by Lang" },
      ["v"] = { '<Cmd>lua require("cwebster.utils").scratchBuffer("vsplit")<CR>', "Scrach buffer in vert split"},
    },
    ["h"] = {
      name = "+help",
      ["t"] = { "<cmd>Telescope builtin<cr>", "Telescope" },
      ["c"] = { "<cmd>Telescope commands<cr>", "Commands" },
      ["h"] = { "<cmd>Telescope help_tags<cr>", "Help Pages" },
      ["m"] = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
      ["k"] = { "<cmd>Telescope keymaps<cr>", "Key Maps" },
      ["s"] = { "<cmd>Telescope highlights<cr>", "Search Highlight Groups" },
      ["l"] = { [[<cmd>TSHighlightCapturesUnderCursor<cr>]], "Highlight Groups at cursor" },
      ["f"] = { "<cmd>Telescope filetypes<cr>", "File Types" },
      ["o"] = { "<cmd>Telescope vim_options<cr>", "Options" },
      ["a"] = { "<cmd>Telescope autocommands<cr>", "Auto Commands" },
      ["i"] = { "<cmd>echo \"hi<\" . synIDattr(synID(line(\".\"),col(\".\"),1),\"name\") . '> trans<' . synIDattr(synID(line(\".\"),col(\".\"),0),\"name\") . \"> lo<\" . synIDattr(synIDtrans(synID(line(\".\"),col(\".\"),1)),\"name\") . \">\"<CR> ", "Highlight Under Cursos"},
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
      ["s"] = { ":SymbolsOutline<CR>", "Symbols" },
      --["t"] = { "<cmd>lua require('_nvimtree').toggle_tree()<cr>", "NvimTree" },
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
    ["x"] = {
      name = "+trouble",
      ["x"] = {'<cmd>LspTroubleToggle<cr>', "Trouble" },
      ["w"] = {'<cmd>LspTroubleToggle lsp_workspace_diagnostics<cr>', "lsp workspace" },
      ["d"] = {'<cmd>LspTroubleToggle lsp_document_diagostics<cr>', "lsp document" },
      ["q"] = {'<cmd>LspTroubleToggle quickfix<cr>', "quickfix" },
      ["l"] = {'<cmd>LspTroubleToggle loclist<cr>', "loclist" },
    },
    ["t"] = {
      name = "+testing",
      ["r"] = { "<Plug>RestNvim<CR>", "REST request"},
      ["t"] = { "<cmd>TestNearest<CR>", "Nearest" },
      ["f"] = { "<cmd>TestFile<CR>", "File" },
      ["s"] = { "<cmd>TestSuite<CR>", "Suite" },
      ["_"] = { "<cmd>TestLast<CR>", "Last" },
    },
    ["d"] = {
      name = "+debug",
      ["d"] = { "JestStrategy"},
      ["h"] = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Breakpoint" },
      ["s"] = { "<cmd>lua require'dap'.stop()<CR>", "Stop" },
      ["n"] = { "<cmd>lua require'dap'.continue()<CR>", "Cont" },
      ["k"] = { "<cmd>lua require'dap'.up()<CR>", "Up" },
      ["j"] = { "<cmd>lua require'dap'.down()<CR>", "Down" },
      ["_"] = { "<cmd>lua require'dap'.disconnect();require'dap'.stop();require'dap'.run_last()<CR>", "Disco" },
      ["r"] = { "<cmd>lua require'dap'.repl.open({}, 'vsplit')<CR><C-w>l", "REPL" },
      -- ["i"] = { "<cmd>lua require'dap.ui.variables'.hover()<CR>", "" },
      -- ["?"] = { "<cmd>lua require'dap.ui.variables'.scopes()<CR>", "" },
      ["e"] = { "<cmd>lua require'dap'.set_exception_breakpoints({'all'})<CR>", "Enable BPs" },
      ["a"] = { "<cmd>lua require'debugHelper'.attach()<CR>", "Attack" },
      ["A"] = { "<cmd>lua require'debugHelper'.attachToRemote()<CR>", "Att Remote" },
      ["i"] = { "<cmd>lua require'dap.ui.widgets'.hover()<CR>", "UI" },
      ["?"] = { "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>", "Scopes" },
      ["f"] = { "<cmd>Telescope dap frames<CR>", "Frames" },
      ["c"] = { "<cmd>Telescope dap commands<CR>", "Commands" },
      ["b"] = { "<cmd>Telescope dap list_breakpoints<CR>", "List BPs" },
    },
    ["m"] = { "<Cmd>BufferLineCyclePrev<CR>", "Previous Buffer" },
    ["i"] = { "<Cmd>BufferLineCycleNext<CR>", "Next Buffer" },
  }


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
    ["<C-_>"] = { "<cmd>CommentToggle<cr>", "Comment Line" },
    -- ["<C-s>"] = { "<Cmd>BufferPick<CR>", "Pick Buffer" },
    --["<C-p>"] = { "<Cmd>FGFiles<CR>", "Git Files" },
  }
-- nnoremap <S-k> :lua require'dap'.step_out()<CR>
-- nnoremap <S-l> :lua require'dap'.step_into()<CR>
-- nnoremap <S-j> :lua require'dap'.step_over()<CR>

  local visual_map = {
    ["<C-_>"] = { ":'<,'>CommentToggle<cr>", "Comment Lines" },
    ["J"] = { "<cmd>m '>+1<CR>gv=gv", "Move down"},
    ["K"] = { "<cmd>m '<-2<CR>gv=gv", "Move up"},
  }
-- vnoremap <leader>di :lua require'dap.ui.variables'.visual_hover()<CR>

  wk.register(leader_map, { prefix = "<leader>" })
  wk.register(normal_map)
  wk.register(visual_map, { mode = "v" })


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

  vim.api.nvim_set_keymap('n', '<F10>', '<cmd>lua ToggleMouse()<cr>', { noremap = true })
end

M.lsp_setup = function(client, bufnr)
  local wk = require("which-key")

  local opts = { noremap = true, silent = true, buffer = bufnr}

  local keymap = {
    c = {
      name = "+code",
      ["r"] = { "<cmd>lua require('lspsaga.rename').rename()<CR>", "Rename" },
      ["a"] = { "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", "Code Action" },
      ["d"] = { "<cmd>lua vim.diagnostic.open_float(inil,{source=always,focusable=false,border='rounded'})<CR>", "Line Diagnostics"},
      ["l"] = {
        name = "+lsp",
        i = { "<cmd>LspInfo<cr>", "Lsp Info" },
        a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "Add Folder" },
        r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove Folder" },
        l = {
          "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
          "List Folders"
        }
      }
    },
    x = {
      s = { "<cmd>Telescope lsp_document_diagnostics<cr>", "Search Document Diagnostics" },
      W = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" }
    }
  }

  if client.name == "typescript" then
    keymap.c.o = { "<cmd>:TSLspOrganize<CR>", "Organize Imports" }
    keymap.c.R = { "<cmd>:TSLspRenameFile<CR>", "Rename File" }
  end

  local keymap_visual = {
    c = {
      name = "+code",
      a = { ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>", "Code Action" }
    }
  }

  local keymap_goto = {
    name = "+goto",
    r = { "<cmd>Telescope lsp_references<cr>", "References" },
    R = { "<cmd>LspTrouble lsp_references<cr>", "Trouble References" },
    D = { "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", "Peek Definition" },
    d = { "<Cmd>lua vim.lsp.buf.definition()<CR>", "Goto Definition" },
    s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
    I = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto Implementation" },
    -- I = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "Goto Declaration" },
    t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Goto Type Definition" },
    ["k"] = { "<Cmd>lua vim.lsp.buf.hover()<CR>", "Lsp Hoverdoc" },
    ["h"] = { "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", "Lsp Finder" },
  }

  map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev({popup_opts={focusable=false,border='rounded'}})<CR>", opts)
  map("n", "]d", "<cmd>lua vim.diagnostic.goto_next({popup_opts={focusable=false,border='rounded'}})<CR>", opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    keymap.c.f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format Document" }
  elseif client.resolved_capabilities.document_range_formatting then
    keymap_visual.c.f = { "<cmd>lua vim.lsp.buf.range_formatting()<CR>", "Format Range" }
  end

  wk.register(keymap, { buffer = bufnr, prefix = "<leader>" })
  wk.register(keymap_visual, { buffer = bufnr, prefix = "<leader>", mode = "v" })
  wk.register(keymap_goto, { buffer = bufnr, prefix = "g" })
end

M.setup_ft_mappings = function()

  augroup("globalftmaps", {
      {'FileType', 'markdown', 'lua registerMappingsMD()'},
      {'FileType', 'fugitive', 'lua registerMappingsFugitive()'},
      {'FileType', 'gitcommit', 'lua registerMappingsCommitMsg()'},
    }
  )

  _G.registerMappingsCommitMsg = function()
    local wk = require("which-key")
    local buf = vim.api.nvim_get_current_buf()

    wk.register({
      ["g"] = {
        name = "+git",
        ["a"] = { "<cmd>lua require('telescope').extensions.githubcoauthors.coauthors()<CR>", "coauthors" },
      }
    }, { buffer = buf, prefix = "<leader>" })
  end

  _G.registerMappingsMD = function()
    local wk = require("which-key")
    local buf = vim.api.nvim_get_current_buf()

    wk.register({
      ["<C-s>"] = {
        name = "+Markdown",
        ["p"] = { "<cmd>MarkdownPreview<cr>", "Preview", buffer = buf }
      }
    })

  end

  _G.registerMappingsFugitive = function()
    local wk = require("which-key")
    local buf = vim.api.nvim_get_current_buf()

    wk.register({
      ["q"] = { "<c-w>q", "Close Fugitive", buffer = buf },
      ["C"] = { "cc", "Git Commit", buffer = buf },
      ["D"] = { "dd", "D", buffer = buf },
      ["PP"] = { "<cmd>Git push<cr>", "Git Push", buffer = buf },
    })

  end

end

return M
