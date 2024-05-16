return {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
  },
  keys = {
    { "<leader>cgc", "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
    { "<leader>cge", "<cmd>ChatGPTEditWithInstruction<CR>", desc = "Edit with instruction", mode = { "n", "v" } },
    { "<leader>cgg", "<cmd>ChatGPTRun grammar_correction<CR>", desc = "Grammar Correction", mode = { "n", "v" } },
    { "<leader>cgt", "<cmd>ChatGPTRun translate<CR>", desc = "Translate", mode = { "n", "v" } },
    { "<leader>cgk", "<cmd>ChatGPTRun keywords<CR>", desc = "Keywords", mode = { "n", "v" } },
    { "<leader>cgd", "<cmd>ChatGPTRun docstring<CR>", desc = "Docstring", mode = { "n", "v" } },
    { "<leader>cga", "<cmd>ChatGPTRun add_tests<CR>", desc ="Add Tests", mode = { "n", "v" } },
    { "<leader>cgo", "<cmd>ChatGPTRun optimize_code<CR>", desc = "Optimize Code", mode = { "n", "v" } },
    { "<leader>cgs", "<cmd>ChatGPTRun summarize<CR>", desc = "Summarize", mode = { "n", "v" } },
    { "<leader>cgf", "<cmd>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs", mode = { "n", "v" } },
    { "<leader>cgx", "<cmd>ChatGPTRun explain_code<CR>", desc = "Explain Code", mode = { "n", "v" } },
    { "<leader>cgr", "<cmd>ChatGPTRun roxygen_edit<CR>", desc = "Roxygen Edit", mode = { "n", "v" } },
    { "<leader>cgl", "<cmd>ChatGPTRun code_readability_analysis<CR>", desc = "Code Readability Analysis", mode = { "n", "v" } },
  },
  config = function()
    require("chatgpt").setup()
  end
}
