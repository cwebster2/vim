local map = require("cwebster.utils").map
local augroup = require("cwebster.utils").augroup

local M = {}

M.init_keymap = function()
  map("n", "<leader>gc", "<Cmd>Telescope git_commits<CR>", { desc = "Show git commits" })
  map("n", "<leader>gb", "<Cmd>Telescope git_branches<CR>", { desc = "Show git branches" })
  map("n", "<leader>gs", "<Cmd>Telescope git_status<CR>", { desc = "Show git status" })
  map("n", "<leader>gi", function()
    require("telescope").extensions.gh.issues()
  end, { desc = "Show gh issues" })
  map("n", "<leader>gp", function()
    require("telescope").extensions.gh.pull_request()
  end, { desc = "Show gh pr" })
  map("n", "<leader>gf", "<Cmd>OpenInGHFile<CR>", { desc = "Open file in github" })
  --l = { function() require"util".float_terminal("lazygit") end, "LazyGit" },
  --["d"] = { "<cmd>DiffviewOpen<cr>", "DiffView" },
  map({ "n", "v" }, "<leader>ghs", function()
    require("gitsigns").stage_hunk()
  end, { desc = "Stage hunk" })

  map("n", "<leader>bs", function()
    require("telescope.builtin").buffers()
  end, { desc = "Buffers" })
  map("n", "<leader>bb", "<cmd>e#<CR>", { desc = "Last Buffer" })
  map("n", "<leader>bv", function()
    require("cwebster.utils").scratchBuffer("vsplit")
  end, { desc = "Scrach buffer in vert split" })

  -- <leader>h -- help

  map("n", "<leader>ht", "<cmd>Telescope builtin<cr>", { desc = "Telescope" })
  map("n", "<leader>hc", "<cmd>Telescope commands<cr>", { desc = "Commands" })
  map("n", "<leader>hh", "<cmd>Telescope help_tags<cr>", { desc = "Help Pages" })
  map("n", "<leader>hm", "<cmd>Telescope man_pages<cr>", { desc = "Man Pages" })
  -- map("n", "<leader>hk", "<cmd>Telescope keymaps<cr>", { desc = "Key Maps"}, "help", "telescope_keymaps_all")
  map("n", "<leader>hs", "<cmd>Telescope highlights<cr>", { desc = "Search Highlight Groups" })
  map(
    "n",
    "<leader>hl",
    "<cmd>TSHighlightCapturesUnderCursor<cr>",
    { desc = "Highlight Groups at cursor" }
  )
  map("n", "<leader>hf", "<cmd>Telescope filetypes<cr>", { desc = "File Types" })
  map("n", "<leader>ho", "<cmd>Telescope vim_options<cr>", { desc = "Options" })
  map("n", "<leader>ha", "<cmd>Telescope autocommands<cr>", { desc = "Auto Commands" })
  map(
    "n",
    "<leader>hi",
    '<cmd>echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . \'> trans<\' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR> ',
    { desc = "Highlight Under Cursos" }
  )

  -- <leader>f -- file finders
  --
  map(
    "n",
    "<leader>fg",
    "<cmd>lua require('telescope.builtin').git_files()<CR>",
    { desc = "Find Git Files" }
  )
  map("n", "<leader>fn", "<cmd>enew<CR>", { desc = "New File" })

  -- leader s -- searching
  map("n", "<leader>sg", "<cmd>lua require('telescope.builtin').live_grep()<CR>", { desc = "Grep" })
  map("n", "<leader>sc", function()
    vim.cmd.noh()
  end, { desc = "Clear search highlight" })
  map(
    "n",
    "<leader>sl",
    "<cmd>lua require('telescope.builtin').loclist()<CR>",
    { desc = "Loclist" }
  )
  map(
    "n",
    "<leader>sq",
    "<cmd>lua require('telescope.builtin').quickfix()<CR>",
    { desc = "Quickfix" }
  )
  map("n", "<leader>ss", "<cmd>lua require('telescope.builtin').spell_suggest()<CR>")

  -- leader t -- testing
  map("n", "<leader>tr", "<Plug>RestNvim<CR>", { desc = "REST request", noremap = true })
  map("n", "<leader>tt", "<cmd>TestNearest<CR>", { desc = "Nearest" })
  map("n", "<leader>tf", "<cmd>TestFile<CR>", { desc = "File" })
  map("n", "<leader>ts", "<cmd>TestSuite<CR>", { desc = "Suite" })
  map("n", "<leader>t_", "<cmd>TestLast<CR>", { desc = "Last" })

  map("n", "<leader>z", function()
    require("notify").dismiss()
    vim.cmd.noh()
  end, { desc = "Clear hightlights and notifications" })

  map("v", "J", "<cmd>m '>+1<CR>gv=gv", { desc = "Move down" })
  map("v", "K", "<cmd>m '<-2<CR>gv=gv", { desc = "Move up" })
  -- vnoremap <leader>di :lua require'dap.ui.variables'.visual_hover()<CR>

  -- testing
  --map('n', '<Leader>fo', "<cmd>lua require('telescope.builtin').colorscheme()<CR>", {noremap=true})

  -- move between splits
  --map('n', '<C-m>', '<C-w><C-h>', {noremap=true})
  --map('n', '<C-n>', '<C-w><C-j>', {noremap=true})
  --map('n', '<C-e>', '<C-w><C-k>', {noremap=true})
  --map('n', '<C-i>', '<C-w><C-l>', {noremap=true})


  -- visual line movement
  map("", "j", "(v:count == 0 ? 'gj' : 'j')", { expr = true, noremap = true, silent = true })
  map(
    "",
    "<Down>",
    "(v:count == 0 ? 'gj' : '<Down>')",
    { expr = true, noremap = true, silent = true }
  )
  map("", "k", "(v:count == 0 ? 'gk' : 'k')", { expr = true, noremap = true, silent = true })
  map("", "<Up>", "(v:count == 0 ? 'gk' : '<Up>')", { expr = true, noremap = true, silent = true })

  map("i", "<A-t>", 'copilot#Accept("")', { expr = true, noremap = true, silent = true })
  -- quick spilt
  map("n", "<Leader>v", "<C-w>v<C-w>w", {})

  -- map('c', "<up>", 'wildmenumode() ? "\<left>" : "\<up>"', {expr=true, noremap=true, silent=true})

  map("n", "+", "<C-a>", {})
  map("n", "-", "<C-x>", {})

  -- spell
  map("n", "<F9>", ":set spell!<cr>", { silent = true })
  map("i", "<F9>", "<C-O>:set spell!<cr>", { silent = true })

  -- location list
  map("n", "<Leader>ll", ":lopen<cr>", {})
  map("n", "<Leader>j", ":lnext<cr>", {})
  map("n", "<Leader>k", ":lprev<cr>", {})
  map("n", "<Leader>lc", ":lclose<cr>", {})

  -- quick list
  map("n", "<Leader>ql", ":copen<cr>", {})
  map("n", "<Leader>qn", ":cnext<cr>", {})
  map("n", "<Leader>qp", ":cprev<cr>", {})
  map("n", "<Leader>qc", ":cclose<cr>", {})

  -- maximizer
  map("n", "<F3>", ":MaximizerToggle<CR>", { silent = true })
  map("v", "<F3>", ":MaximizerToggle<CR>", { silent = true })
  map("i", "<F3>", "<C-o>:MaximizerToggle<CR>", { silent = true })

  -- neotermm
  map("t", "<c-w>", "<c-\\><c-n><c-w>", { noremap = true })


M.lsp_setup = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  map(
    "n",
    "<leader>cd",
    "<cmd>lua vim.diagnostic.open_float(nil,{source=always,focusable=false,border='rounded'})<CR>",
    opts,
    "Open floating diagnostic window"
  )
  map("n", "<leader>cli", "<cmd>LspInfo<cr>", opts, "Show LSP information")
  map(
    "n",
    "<leader>cla",
    "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
    opts,
    "Add workspace folder"
  )
  map(
    "n",
    "<leader>clr",
    "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
    opts,
    "Remove workspace folder"
  )
  map(
    "n",
    "<leader>cll",
    "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
    opts,
    "List workspace folders"
  )

  map(
    "n",
    "<leader>xs",
    "<cmd>Telescope lsp_document_diagnostics<cr>",
    opts,
    "Open document diagnostics in telescope"
  )
  map(
    "n",
    "<leader>xW",
    "<cmd>Telescope lsp_workspace_diagnostics<cr>",
    opts,
    "Open workspace diagnostics in telescope"
  )

  if client.name == "typescript" then
    map("n", "<leader>co", "<cmd>:TSLspOrganize<CR>", opts, "Typescript: Organize imports")
    map("n", "<leader>cR", "<cmd>:TSLspRenameFile<CR>", opts, "Typescript: Rename file")
  end

  if client.name == "rust_analyzer" then
    map(
      "n",
      "<leader>co",
      require("rust-tools").hover_actions.hover_actions,
      opts,
      "Rust: show hover actions"
    )
  end

  map("v", "<leader>ca", ":<C-U>lua vim.lsp.buf.code_action()<CR>", opts)

  map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts, "Show lsp signature help")
  map("n", "gk", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts, "Show lsp buffer hover actions")
  map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts, "Show lsp buffer hover actions")
  map(
    "n",
    "[d",
    "<cmd>lua vim.diagnostic.goto_prev({popup_opts={focusable=false,border='rounded'}})<CR>",
    opts,
    "Prev diagnostic"
  )
  map(
    "n",
    "]d",
    "<cmd>lua vim.diagnostic.goto_next({popup_opts={focusable=false,border='rounded'}})<CR>",
    opts,
    "Next diagnostic"
  )
  map("i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

  -- Set some keybinds conditional on server capabilities
  if client.server_capabilities.documentFormattingProvider then
    map(
      "n",
      "<leader>cf",
      "<cmd>lua vim.lsp.buf.format({ async = true })<CR>",
      opts,
      "Format document (lsp)"
    )
  elseif client.server_capabilities.documentRangeFormattingProvider then
    map("v", "<leader>cf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end
end

M.setup_ft_mappings = function()
  augroup("globalftmaps", {
    { "FileType", "markdown", "lua registerMappingsMD()" },
    { "FileType", "gitcommit", "lua registerMappingsCommitMsg()" },
  })

  _G.registerMappingsCommitMsg = function()
    local buf = vim.api.nvim_get_current_buf()
    map(
      "n",
      "ga",
      "<cmd>lua require('telescope').extensions.githubcoauthors.coauthors()<CR>",
      { buffer = buf, desc = "Github Co-authors" }
    )
  end

  _G.registerMappingsMD = function()
    local buf = vim.api.nvim_get_current_buf()
    map("n", "<C-S>p", "<cmd>MarkdownPreview<cr>", { buffer = buf })
  end
end

return M
