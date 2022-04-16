local M = {}

function M.setup()
  require("filetype").setup({
    overrides = {
      literal = {
        after_containerize = "bash",
        on_containerize = "bash",
        orders = "bash"
      },
      complex = {
        ["%.zfunc/.*"] = "zsh"
      }
    }
  })
end

return M
