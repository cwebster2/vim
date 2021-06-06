local M={}

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
    indent = {
      enable = true
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
      disable = {},
    },
    rainbow = {
      enable = true,
      disable = {'bash'},
    },
    refactor = {
      highlight_definitions = { enable = true },
      highlight_current_scope = { enable = true },
    },
    autotag = {
      enable = true
    }
  }
end

return M
