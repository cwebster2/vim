local vim = vim
local cp_api = require("catppuccino.api.colors")
local M = {}
local catppuccino_theme = "dark_catppuccino"

local err, colors = cp_api.get_colors(catppuccino_theme)
colors.diff = {
  add = 'green',
  change = "#2B5B77",
  delete = 'red',
  remove = 'red',
}
colors.neogit = {
  addbg = "#012800",
  delbg = "#340001",
}

M.galaxyline_colors = colors

M.mode_color = {
  --n = 'DarkGoldenrod2',
  n = colors.green,
  i = colors.blue,
  v = 'gray',
  [""] = 'gray',
  V = 'gray',
  c = 'plum3',
  no = 'DarkGoldenrod2',
  s = 'SkyBlue2',
  S = 'SkyBlue2',
  [""] = 'SkyBlue2',
  ic = 'chartreuse3',
  R = 'purple',
  Rv = 'purple',
  cv = 'plum3',
  ce = 'plum3',
  r = 'chocolate',
  rm = 'chocolate',
  ["r?"] = 'chocolate',
  ["!"] = 'plum3',
  t = 'plum3'
}

M.colorscheme_setup = function(scheme)
  scheme = scheme or "jellybeans"
  -- scheme = scheme or "nightfox"

  vim.api.nvim_command [[syntax on]]
  if vim.fn.has('termguicolors') == 1 then
    vim.cmd[[set termguicolors]]
  end

  vim.o.background = "dark"

  vim.g.jellybeans_use_term_italics = 1
  vim.g.jellybeans_overrides = {
    background = {
      ctermbg = 'none',
      guibg = 'none'
    },
  }

  vim.g.sonokai_style = 'shusia'
  vim.g.sonokai_transparent_background = 1
  vim.g.sonokai_enable_italic = 1
  vim.g.sonokai_disable_italic_comment = 1

  vim.g.nightflyCursorColor = 1
  vim.g.nightflyUnderlineMatchParen = 1
  vim.g.nightflyUndercurls = 1
  vim.g.nightflyCursorColor = 1
  vim.g.nightflyTransparent = 1

  local catppuccino_options = {
    colorscheme = catppuccino_theme,
      transparency = true,
      styles = {
        comments = "italic",
        functions = "italic",
        keywords = "italic",
        strings = "NONE",
        variables = "NONE",
      },
      integrations = {
        treesitter = true,
        native_lsp = {
          enabled = true,
          styles = {
            errors = "italic",
            hints = "italic",
            warnings = "italic",
            information = "italic"
          }
        },
        lsp_trouble = true,
        lsp_saga = true,
        gitsigns = true,
        telescope = true,
        nvimtree = {
          enabled = true,
          show_root = true,
        },
        which_key = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = false,
        },
        dashboard = false,
        neogit = true,
        vim_sneak = false,
        fern = false,
        bufferline = true,
        markdown = true,
    }
  }

  if scheme == "catppuccino" then
    local catppuccino = require("catppuccino")
    catppuccino.setup(catppuccino_options)
    catppuccino.remap({
        diff = {
          add = colors.diff.add,
          change = colors.diff.change,
          delete = colors.diff.delete,
          remove = colors.diff.remove,
        },
      },{
        NeogitDiffDeleteHighlight = { bg = colors.neogit.delbg },
        NeogitDiffAddHighlight = { bg = colors.neogit.addbg },
        NeogitDiffContextHighlight = { bg = colors.none },
        -- ColorColumn = { fg = colors.none }
      })
    catppuccino.load()
  else
    vim.api.nvim_command("colorscheme "..scheme)
  end
end

M.overrides_setup = function()
  vim.fn.sign_define("LspDiagnosticsSignError", {text = "✘", texthl = "LspDiagnosticsError"})
  vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", texthl = "LspDiagnosticsWarning"})
  vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "🛈", texthl = "LspDiagnosticsInformation"})
  vim.fn.sign_define("LspDiagnosticsSignHint", {text = "💡", texthl = "LspDiagnosticHint"})
  vim.cmd[["highlight! BufferTabpageFil guibg=none]]
  vim.cmd[["highlight! BufferlineBufferSelected gui=underline]]
  --"autocmd ColorScheme * highlight NvimTreeFolderIcon guibg=blue
end

-- vim.g.bufferline = {
--   closable = false
-- }

return M

