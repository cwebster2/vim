local ok, telescope = pcall(require, "telescope")

if not ok then
  print("telescope not installed, run PackerSync")
  do return end
end

local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")
local map = require("cwebster.utils").map

-- mappings
map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>", { desc = "Find Files"})
map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').git_files()<CR>", { desc = "Find Git Files"})
map("n", "<leader>fr", "<cmd>lua require('telescope.builtin').oldfiles()<CR>", { desc = "Recent Files"})

map("n", "<leader>sg", "<cmd>lua require('telescope.builtin').live_grep()<CR>", { desc = "Grep"})
map("n", "<leader>sl", "<cmd>lua require('telescope.builtin').loclist()<CR>", { desc = "Loclist"})
map("n", "<leader>sq", "<cmd>lua require('telescope.builtin').quickfix()<CR>",{ desc = "Quickfix"})
map("n", "<leader>ss", "<cmd>lua require('telescope.builtin').spell_suggest()<CR>")

map("n", "<leader>hk", "<Cmd>Telescope keymaps<CR>", { desc = "Find keymaps"})
map("n", "<leader>ht", "<cmd>Telescope builtin<cr>", { desc = "Telescope"})
map("n", "<leader>hc", "<cmd>Telescope commands<cr>", { desc = "Commands"})
map("n", "<leader>hh", "<cmd>Telescope help_tags<cr>", { desc = "Help Pages"})
map("n", "<leader>hm", "<cmd>Telescope man_pages<cr>", { desc = "Man Pages"})
-- map("n", "<leader>hk", "<cmd>Telescope keymaps<cr>", { desc = "Key Maps"}, "help", "telescope_keymaps_all")
map("n", "<leader>hs", "<cmd>Telescope highlights<cr>", { desc = "Search Highlight Groups"})
map("n", "<leader>hf", "<cmd>Telescope filetypes<cr>", { desc = "File Types"})
map("n", "<leader>ho", "<cmd>Telescope vim_options<cr>", { desc = "Options"})
map("n", "<leader>ha", "<cmd>Telescope autocommands<cr>", { desc = "Auto Commands"})

map("n", "<leader>gc", "<Cmd>Telescope git_commits<CR>", { desc = "Show git commits" })
map("n", "<leader>gb", "<Cmd>Telescope git_branches<CR>", { desc = "Show git branches" })
map("n", "<leader>gs", "<Cmd>Telescope git_status<CR>", { desc = "Show git status" })
map("n", "<leader>gi", function() require('telescope').extensions.gh.issues() end, { desc = "Show gh issues" })
map("n", "<leader>gp", function() require('telescope').extensions.gh.pull_request() end, { desc = "Show gh pr" })

-- config

telescope.setup {
    defaults = {
        mappings = {
            i = {
                -- horizontal split
                ["<C-x>"] = false,
                ["<C-s>"] = actions.select_vertical,
                ["<CR>"] = actions.select_default + actions.center,
                ["<C-p>"] = actions.select_default + actions.center,
                -- next | prev
                ["<C-n>"] = actions.move_selection_next,
                ["<C-e>"] = actions.move_selection_previous,
                -- use esc for exit no normal mode
                ["<esc>"] = actions.close,
                ["<tab>"] = actions.toggle_selection,
                ["<C-q>"] = actions.send_to_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist,
                ["<C-t>"] = trouble.open_with_trouble,
                ["<C-h>"] = "which_key"
            },
            n = {
                -- horizontal split
                ["<C-x>"] = false,
                ["<C-s>"] = actions.select_vertical,
                ["<CR>"] = actions.select_default + actions.center,
                -- next | prev
                ["i"] = false,
                ["j"] = false,
                ["n"] = actions.move_selection_next,
                ["e"] = actions.move_selection_previous,
                -- use esc for exit no normal mode
                ["<esc>"] = actions.close,
                ["<C-t>"] = trouble.open_with_trouble,
                ["<C-h>"] = "which_key"
            },
        },
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case"
        },
        prompt_prefix = ">",
        selection_carat = ">",
        entry_prefix = " ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            mirror = false,
          },
          vertical = {
            mirror = false,
          },
          -- width = 0.75,
          -- height = 1,
          -- preview_cutoff = 120,
          -- prompt_position = "bottom",
        },
        file_sorter = require "telescope.sorters".get_fuzzy_file,
        file_ignore_patterns = {"^%.git$", "node_modules"},
        generic_sorter = require "telescope.sorters".get_generic_fuzzy_sorter,
        path_display = {
          -- "shorten",
          "absolute"
        },
        winblend = 5,
        border = {},
        borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
        color_devicons = true,
        use_less = true,
        set_env = {["COLORTERM"] = "truecolor"},
        file_previewer = require "telescope.previewers".vim_buffer_cat.new,
        grep_previewer = require "telescope.previewers".vim_buffer_vimgrep.new,
        qflist_previewer = require "telescope.previewers".vim_buffer_qflist.new,
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case"
      },
      ["ui-select"] = {
        require("telescope.themes").get_dropdown {
        -- even more opts
        }
      }
    }
}

-- the fzy extension changes the behavior of telescope in a way i don't like
require('telescope').load_extension('fzf')
require('telescope').load_extension('octo')
require('telescope').load_extension('githubcoauthors')
require('telescope').load_extension('dap')
require('telescope').load_extension('ui-select')
