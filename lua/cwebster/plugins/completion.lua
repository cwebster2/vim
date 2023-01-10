return {
  -- PLUGINS: Completion
    { "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      config = function()
        require("cwebster.completion").setup()
      end,
      dependencies = {
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
        -- "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-nvim-lsp-document-symbol",
        "hrsh7th/cmp-cmdline",
        "Saecki/crates.nvim",
        "f3fora/cmp-spell",
        {"petertriho/cmp-git", dependencies = "nvim-lua/plenary.nvim"}
      },
    },
}

