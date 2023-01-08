
local servers = {
  pyright = {},
  html = {},
  bashls = {},
  -- rust-tools configures this
  -- rust_analyzer = {},
  tsserver = {},
  vuels = {},
  svelte = {},
  gopls = {},
  -- deno = {},
  terraformls = {
    filetypes = {"tf", "terraform"},
  },
  dockerls = {},
  jsonls = {},
  -- clangd = {
  --   handlers = lsp_status.extensions.clangd.setup(),
  -- },
  sqlls = {},
  -- sumneko_lua = {
  --   settings = {
  --     Lua = {
  --       workspace = {
  --         checkThirdParty = false,
  --       },
  --       completion = {
  --         callSnippet = "Replace",
  --       },
  --     },
  --   },
  -- },
  texlab = {
    settings = {
      latex = {
        build = {
          executable = "pdflatex",
          onSave = true;
        }
      }
    }
  },
  yamlls = {},
  vimls = {},
  -- jdtls = {},
  sumneko_lua = {},
}

return servers
