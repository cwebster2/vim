local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")


require("telescope").setup {
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
                ["<C-t"] = trouble.open_with_trouble,
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
                ["<C-t"] = trouble.open_with_trouble,
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
        -- file_sorter = require "telescope.sorters".get_fzy_sorter,
        file_sorter = require "telescope.sorters".get_fuzzy_file,
        --file_sorter = require "telescope.sorters".fuzzy_with_index_bias,
        file_ignore_patterns = {".git", "node_modules"},
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
        fzy_native = {
          override_generic_sorter = false,
          override_file_sorter = true,
        }
    }
}

-- the fzy extension changes the behavior of telescope in a way i don't like
require('telescope').load_extension('fzy_native')
require('telescope').load_extension('octo')
require('telescope').load_extension('githubcoauthors')
require('telescope').load_extension('dap')

