local g = vim.g
local a = vim.api

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
g.mapleader = " "
g.maplocalleader = ","

g.have_nerd_font = true

-- set global, window and buffer options
require("cwebster.options")
-- require("cwebster.earlystartup").setup()

vim.cmd.cd(vim.fs.root(0, ".git") or ".")

vim.cmd("packadd nvim.undotree")
-- vim.cmd("packadd nvim.diffview")

vim.pack.add({
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/lewis6991/gitsigns.nvim", name = "gitsigns" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" }, -- dependency
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
  { src = "https://github.com/akinsho/nvim-bufferline.lua", name = "bufferline" }, -- VeryLazy
  { src = "https://github.com/nvim-mini/mini.nvim" },
  { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- dependecy
  { src = "https://github.com/Bekaboo/dropbar.nvim" },
  { src = "https://github.com/lukas-reineke/indent-blankline.nvim", name = "ibl" },
  { src = "https://github.com/folke/snacks.nvim" },
  { src = "https://github.com/nvim-lua/plenary.nvim" }, -- dependency
  { src = "https://github.com/obsidian-nvim/obsidian.nvim", version = vim.version.range("*") }, -- lazy?
  { src = "https://github.com/williamboman/mason.nvim" },
  { src = "https://github.com/j-hui/fidget.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" }, -- dependency
  { src = "https://github.com/nvim-telescope/telescope.nvim" }, -- VimEnter
  { src = "https://github.com/saghen/blink.compat" }, -- dep
  { src = "https://github.com/zbirenbaum/copilot.lua", name = "copilot" }, -- dep InsertEnter
  {
    src = "https://github.com/L3MON4D3/LuaSnip",
    version = vim.version.range("v2.*"),
    build = "make",
  }, -- dep
  { src = "https://github.com/folke/lazydev.nvim" }, -- dep ft=lua
  { src = "https://github.com/fang2hou/blink-copilot" }, --dep
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("v1.*") }, -- VimEnter
  { src = "https://github.com/CopilotC-Nvim/CopilotChat.nvim" },
  { src = "https://github.com/stevearc/conform.nvim", name = "conform" }, -- BufWritePre
  { src = "https://github.com/folke/which-key.nvim" }, -- VimEnter
  { src = "https://github.com/christoomey/vim-tmux-navigator" }, -- VimEnter
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/NeogitOrg/neogit" }, -- VeryLazy
  { src = "https://github.com/pwntester/octo.nvim" },
  { src = "https://github.com/mfussenegger/nvim-lint" }, -- BufReadPre, BufNewFile
  { src = "https://github.com/rcarriga/nvim-dap-ui" }, --dep
  { src = "https://github.com/nvim-neotest/nvim-nio" }, --dep
  { src = "https://github.com/williamboman/mason.nvim" }, --dep
  { src = "https://github.com/jay-babu/mason-nvim-dap.nvim" }, --dep
  { src = "https://github.com/leoluz/nvim-dap-go" }, --dep
  { src = "https://github.com/mfussenegger/nvim-dap" }, -- lazy?
  { src = "https://github.com/tpope/vim-dadbod" }, --laxy dep
  { src = "https://github.com/kristijanhusak/vim-dadbod-completion" }, --dep ft sql mysql plsql
  { src = "https://github.com/kristijanhusak/vim-dadbod-ui" },
  { src = "https://github.com/tpope/vim-sleuth" },
  { src = "https://github.com/rachartier/tiny-cmdline.nvim" },
})

require("cwebster.keymaps")
require("cwebster.autocommands")

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function()
    a.nvim_command("silent! helptags ALL")
  end,
})
