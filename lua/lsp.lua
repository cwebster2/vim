local M={}

local nvim_lsp = require "lspconfig"
local completion = require "completion"
local map = require("utils").map

local servers = { "pyls", "bashls", "rust_analyzer", "tsserver", "gopls", "terraformls", "dockerls", "jsonls", "texlab", "yamlls", "vimls", "jdtls"}

local on_attach = function(client)
  completion.on_attach(client)

  local opts = {noremap = true, silent = true}
  map("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  map("n", "ga", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  map("n", "gk", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  map("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  map("n", "gr", "<cmd>lua require'telescope.builtin'.lsp_references()<CR>", opts)
  map("n", "<leader>d", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  map("n", "[g", "<cmd> lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  map("n", "]g", "<cmd> lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  vim.api.nvim_command("autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics()")
  vim.api.nvim_command("autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()")
  vim.api.nvim_command("autocmd CursorMoved <buffer> lua vim.lsp.util.buf_clear_references()")
end

function M.setup()
  require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    textobjects = {
      select = {
        enable = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["ab"] = "@block.outer",
          ["ib"] = "@block.inner",
        },
      },
    },
    highlight = {
      enable = true,
      disable = { "ruby" },
    },
    rainbow = {
      enable = true,
      disable = {'bash'},
    },
    refactor = {
      highlight_definitions = { enable = true },
      --highlight_current_scope = { enable = true },
    }
  }

  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup { on_attach = on_attach }
  end

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true,
      virtual_text = {
        spacing = 4,
        prefix = '←',
      },
      signs = true,
      update_in_insert = false,
    }
  )

  vim.g.completion_chain_complete_list = {
    default = {
      { complete_items = { 'dict', 'path', 'lsp', 'buffers', 'snippet'} },
      { mode = { '<c-n>' } },
      { mode = { '<c-p>' } }
    },
  }
  end

  return M
