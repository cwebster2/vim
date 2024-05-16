local M = {}

function M.on_attach(client, buffer)
  local self = M.new(client, buffer)

  self:map("<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
  -- map("n", "<leader>cd", "<cmd>lua vim.diagnostic.open_float(nil,{source=always,focusable=false,border='rounded'})<CR>", opts, "Open floating diagnostic window")
  self:map("<leader>cl", "LspInfo", { desc = "Lsp Info" })
  self:map("<leader>xd", "Telescope diagnostics", { desc = "Telescope Diagnostics" })

  self:map("gd", "Telescope lsp_definitions", { desc = "Goto Definition" })
  -- map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts, "Show lsp definition")
  self:map("gr", "Telescope lsp_references", { desc = "References" })
  self:map("gR", "Trouble lsp_references", { desc = "Show lsp references in trouble " })
  -- self:map("gD", "Telescope lsp_declarations", { desc = "Goto Declaration" })
  self:map("gD", vim.lsp.buf.declaration, { desc = "Show lsp declarations" })
  self:map("gI", "Telescope lsp_implementations", { desc = "Goto Implementation" })
  -- map("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts, "Show lsp implementation")
  self:map("gt", "Telescope lsp_type_definitions", { desc = "Goto Type Definition" })
  -- map("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts, "Show lsp buffer declarations")

  self:map("K", vim.lsp.buf.hover, { desc = "Hover" })
  self:map("[d", M.diagnostic_goto(true), { desc = "Next Diagnostic" })
  self:map("]d", M.diagnostic_goto(false), { desc = "Prev Diagnostic" })
  self:map("]e", M.diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
  self:map("[e", M.diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
  self:map("]w", M.diagnostic_goto(true, "WARNING"), { desc = "Next Warning" })
  self:map("[w", M.diagnostic_goto(false, "WARNING"), { desc = "Prev Warning" })

  self:map("gK", vim.lsp.buf.signature_help, { desc = "Signature Help", mode = { "i", "n" }, has = "signatureHelp" })
  self:map("<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action", mode = { "n", "v" }, has = "codeAction" })

  self:map("<leader>xs", "Telescope lsp_document_diagnostics", { desc = "Open document diagnostics in telescope" })
  self:map("<leader>xW", "Telescope lsp_workspace_diagnostics", { desc = "Open workspace diagnostics in telescope" })
  self:map("gh", "Telescope lsp_document_symbols", { desc = "Show lsp symbols in telescope" })

  local format = require("cwebster.plugins.lsp.format")
  self:map("<leader>cf", format.format, { desc = "Format Document", has = "documentFormatting" })
  self:map("<leader>cf", format.format, { desc = "Format Range", mode = "v", has = "documentRangeFormatting" })
  self:map("<leader>cr", M.rename, { expr = true, desc = "Rename", has = "rename" })
  self:map("<leader>ct", format.toggle, { desc = "Toggle Auto Formatting" })

  if client.name == "tsserver" and pcall(require, "typescript") then
    self:map("<leader>co", "TypescriptOrganizeImports", { desc = "Organize Imports" })
    self:map("<leader>cR", "TypescriptRenameFile", { desc = "Rename File" })
  end

  if client.name == "rust_analyzer" then
    self:map("<leader>co", require("rust-tools").hover_actions.hover_actions, { desc = "Rust: show hover actions" })
  end

  if client.server_capabilities.inlayHintProvider then
    self:map("<leader>uh", function() vim.lsp.inlay_hint(buffer, nil) end, { desc = "Toggle Inlay Hints" })
  end
  -- map("n", "<leader>cli", "<cmd>LspInfo<cr>", opts, "Show LSP information")
  -- map("n", "<leader>cla", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts, "Add workspace folder")
  -- map("n", "<leader>clr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts, "Remove workspace folder")
  -- map("n", "<leader>cll", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts, "List workspace folders")
end

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
