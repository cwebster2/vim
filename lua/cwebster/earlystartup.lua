local M = {}
local g = vim.g

function M.setup()
  -- some globals that need setting before plugins are loaded
  g.python3_host_prog = os.getenv("HOME") .. '/miniconda3/bin/python3'
  g.loaded_netrwPlugin = 1
  g.jsx_ext_required = 0

  g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}
  g.qs_buftype_blacklist = {'terminal', 'nofile'}
  g.qs_lazy_highlight = 1

  g.fzf_command_prefix = 'F'

  g.tex_conceal = ""

  -- figure out what plugin this goes with
  -- vim.api.nvim_command[[
  -- let test#strategy = "neovim"
  -- let test#neovim#term_position = "vertical"
  -- ]]

  if vim.fn.exists("g:neovide") == 1 then
    g.neovide_transparency = 0.8
  end

  -- these need to get setup before plugins run
  -- local signs = { Error = "✘", Warn = "", Hint = "", Info = "" }
  local signs = { Error = "✘", Warn = "", Hint = "", Info = "" }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end
end

return M

