local ok, rest_nvim = pcall(require, "rest-nvim")

if not ok then
  print("rest-nvim not installed, run PackerSync")
  do return end
end

local map = require("cwebster.utils").map

-- mappings
map("n", "<leader>tr", "<Plug>RestNvim<CR>", { desc = "REST request", noremap = true})

-- config
rest_nvim.setup({
  -- Open request results in a horizontal split
  result_split_horizontal = false,
  -- Skip SSL verification, useful for unknown certificates
  skip_ssl_verification = false,
  -- Highlight request on run
  highlight = {
    enabled = true,
    timeout = 150,
  },
  result = {
    -- toggle showing URL, HTTP info, headers at top the of result window
    show_url = true,
    show_http_info = true,
    show_headers = true,
  },
  -- Jump to request line on run
  jump_to_request = false,
  env_file = '.env',
  custom_dynamic_variables = {},
  yank_dry_run = true,
})
