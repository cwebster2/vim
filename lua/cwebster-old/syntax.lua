local M={}

function M.setup()
  local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
  parser_configs.http = {
    install_info = {
      url = "https://github.com/NTBBloodbath/tree-sitter-http",
      files = { "src/parser.c" },
      branch = "main",
    },
  }
end

return M
