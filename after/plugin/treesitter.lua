local ok, _ = pcall(require, "nvim-treesitter")

if not ok then
  print("ccc not installed, run PackerSync")
  do return end
end

local map = require("cwebster.utils").map

-- mappings
map("n", "<leader>hl", "<cmd>TSHighlightCapturesUnderCursor<cr>", { desc = "Highlight Groups at cursor"})
map("n", "<leader>hi", "<cmd>echo \"hi<\" . synIDattr(synID(line(\".\"),col(\".\"),1),\"name\") . '> trans<' . synIDattr(synID(line(\".\"),col(\".\"),0),\"name\") . \"> lo<\" . synIDattr(synIDtrans(synID(line(\".\"),col(\".\"),1)),\"name\") . \">\"<CR> ", { desc = "Highlight Under Cursos"})

-- config

local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
parser_configs.http = {
  install_info = {
    url = "https://github.com/NTBBloodbath/tree-sitter-http",
    files = { "src/parser.c" },
    branch = "main",
  },
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  ignore_install = { "haskell" },
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
        -- ["ax"] = "@table.outer",
      }
    },
  },
  indent = {
    enable = true
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    disable = {},
  },
  rainbow = {
    enable = true,
    disable = {'bash'},
  },
  refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = false },
  },
  autotag = {
    enable = true
  }
}
