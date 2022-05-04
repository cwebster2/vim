local M = {}

local lsp_status = require("lsp-status")

local function lua_cmd()
  local home = vim.fn.expand("$HOME")
  local build = home .. "/src/lua-language-server"
  local bin_location = ""
  -- if jit.os == 'OSX' then
  --   bin_location = 'macOS'
  -- elseif jit.os == 'Linux' then
  --   bin_location = 'Linux'
  -- end
  local bin = build .. "/bin/" .. bin_location .. "/lua-language-server"
  -- return {bin, "-E", build .. "/main.lua"}
  return {bin}
end

M.servers = {
  pyright = {},
  html = {},
  bashls = {},
  -- rust-tools configures this
  -- rust_analyzer = {},
  tsserver = {},
  vuels = {},
  svelte = {},
  gopls = {},
  terraformls = {
    filetypes = {"tf", "terraform"},
  },
  dockerls = {},
  jsonls = {},
  clangd = {
    handlers = lsp_status.extensions.clangd.setup(),
  },
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
  jdtls = {},
  sumneko_lua = require("lua-dev").setup({
    lspconfig = {
      cmd = lua_cmd(),
    },
  }),
}

return M
