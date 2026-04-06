local g = vim.g
local a = vim.api

require("vim._core.ui2").enable({})

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
g.mapleader = " "
g.maplocalleader = ","

g.have_nerd_font = true

-- set global, window and buffer options
require("cwebster.options")
-- require("cwebster.earlystartup").setup()

vim.pack.add({
  -- { "nvim.undotree" },
  -- { "nvim.diftool" },
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
  { src = "https://github.com/epwalsh/obsidian.nvim" }, -- lazy?
  { src = "https://github.com/williamboman/mason.nvim" },
  { src = "https://github.com/j-hui/fidget.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/MunifTanjim/nui.nvim" }, -- dependency
  { src = "https://github.com/folke/noice.nvim" }, -- lazy
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
  { src = "https://github.com/ahmedkhalf/project.nvim" },
})

require("cwebster.keymaps")
require("cwebster.autocommands")

a.nvim_command("silent! helptags ALL")
