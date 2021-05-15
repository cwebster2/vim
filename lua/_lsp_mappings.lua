local wk = require("which-key")
local map = require("utils").map

local M = {}

function M.setup(client, bufnr)

  local opts = { noremap = true, silent = true, buffer = bufnr}

  local keymap = {
    c = {
      name = "+code",
      ["r"] = { "<cmd>lua require('lspsaga.rename').rename()<CR>", "Rename" },
      ["a"] = { "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", "Code Action" },
      ["d"] = { "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>", "Line Diagnostics"},
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
      w = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" }
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
    s = { "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", "Signature Help" },
    I = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto Implementation" },
    -- I = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "Goto Declaration" },
    t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Goto Type Definition" },
    ["k"] = { "<Cmd>lua vim.lsp.buf.hover()<CR>", "Lsp Hoverdoc" },
    ["h"] = { "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", "Lsp Finder" },
  }

  map("n", "K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)
  map("n", "[d", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", opts)
  map("n", "]d", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", opts)

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

return M
