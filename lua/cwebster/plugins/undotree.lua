return {
  "mbbill/undotree",
  init = function(_, opts)
    local wk = require("which-key")
    wk.add({
      { "<leader>U", "<cmd>UndotreeToggle<cr>", desc = "[U]ndotree Toggle" },
    })
  end,
}
