local M={}

local nvim_lsp = require'lspconfig'

local servers = { "pyls", "bashls", "rls", "tsserver", "gopls", "terraformls", "dockerls", "jsonls", "texlab", "yamlls", "vimls", "jdtls"}

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
}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = require'completion'.on_attach }
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
