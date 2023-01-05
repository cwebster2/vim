local M = {}

function M.on_attach(client, buffer)
  local self = M.new(client, buffer)

  self:map("<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
  self:map("<leader>cl", "LspInfo", { desc = "Lsp Info" })
  self:map("<leader>xd", "Telescope diagnostics", { desc = "Telescope Diagnostics" })
  self:map("gd", "Telescope lsp_definitions", { desc = "Goto Definition" })
  self:map("gr", "Telescope lsp_references", { desc = "References" })
  self:map("gD", "Telescope lsp_declarations", { desc = "Goto Declaration" })
  self:map("gI", "Telescope lsp_implementations", { desc = "Goto Implementation" })
  self:map("gt", "Telescope lsp_type_definitions", { desc = "Goto Type Definition" })
  self:map("K", vim.lsp.buf.hover, { desc = "Hover" })
  self:map("[d", M.diagnostic_goto(true), { desc = "Next Diagnostic" })
  self:map("]d", M.diagnostic_goto(false), { desc = "Prev Diagnostic" })
  self:map("]e", M.diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
  self:map("[e", M.diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
  self:map("]w", M.diagnostic_goto(true, "WARNING"), { desc = "Next Warning" })
  self:map("[w", M.diagnostic_goto(false, "WARNING"), { desc = "Prev Warning" })

  self:map("<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help", mode = { "i", "n" }, has = "signatureHelp" })
  self:map("<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action", mode = { "n", "v" }, has = "codeAction" })

  local format = require("cwebster.lsp.format").format
  self:map("<leader>cf", format, { desc = "Format Document", has = "documentFormatting" })
  self:map("<leader>cf", format, { desc = "Format Range", mode = "v", has = "documentRangeFormatting" })
  self:map("<leader>cr", M.rename, { expr = true, desc = "Rename", has = "rename" })

  if client.name == "tsserver" and pcall(require, "typescript") then
    self:map("<leader>co", "TypescriptOrganizeImports", { desc = "Organize Imports" })
    self:map("<leader>cR", "TypescriptRenameFile", { desc = "Rename File" })
  end

  if client.name == "rust_analyzer" then
    self:map("<leader>co", require('rust-tools').hover_actions.hover_actions, { desc = "Rust: show hover actions" })
  end
end
---------------------------

M.lsp_setup = function(client, bufnr)

  local keymap = {}

  local opts = { noremap = true, silent = true, buffer = bufnr }

  map("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts, "Rename symbol")
  map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts, "Buffer code actions")
  map("n", "<leader>cd", "<cmd>lua vim.diagnostic.open_float(nil,{source=always,focusable=false,border='rounded'})<CR>", opts, "Open floating diagnostic window")
  map("n", "<leader>cli", "<cmd>LspInfo<cr>", opts, "Show LSP information")
  map("n", "<leader>cla", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts, "Add workspace folder")
  map("n", "<leader>clr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts, "Remove workspace folder")
  map("n", "<leader>cll", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts, "List workspace folders")
  map("n", "<leader>xs", "<cmd>Telescope lsp_document_diagnostics<cr>", opts, "Open document diagnostics in telescope")
  map("n", "<leader>xW", "<cmd>Telescope lsp_workspace_diagnostics<cr>", opts, "Open workspace diagnostics in telescope")



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


-------------------------
function M.new(client, buffer)
  return setmetatable({ client = client, buffer = buffer }, { __index = M })
end

function M:has(cap)
  return self.client.server_capabilities[cap .. "Provider"]
end

function M:map(lhs, rhs, opts)
  opts = opts or {}
  if opts.has and not self:has(opts.has) then
    return
  end
  vim.keymap.set(
    opts.mode or "n",
    lhs,
    type(rhs) == "string" and ("<cmd>%s<cr>"):format(rhs) or rhs,
    ---@diagnostic disable-next-line: no-unknown
    { silent = true, buffer = self.buffer, expr = opts.expr, desc = opts.desc }
  )
end

function M.rename()
  if pcall(require, "inc_rename") then
    return ":IncRename " .. vim.fn.expand("<cword>")
  else
    vim.lsp.buf.rename()
  end
end

function M.diagnostic_goto(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

return M
