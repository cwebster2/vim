local actions = require("telescope.actions")

require("telescope").setup {
    defaults = {
        mappings = {
            i = {
                -- horizontal split
                ["<C-x>"] = false,
                ["<C-s>"] = actions.goto_file_selection_split,
                ["<CR>"] = actions.goto_file_selection_edit + actions.center,
                -- next | prev
                ["<C-n>"] = actions.move_selection_next,
                ["<C-e>"] = actions.move_selection_previous,
                -- use esc for exit no normal mode
                ["<esc>"] = actions.close
            },
            n = {
                -- horizontal split
                ["<C-x>"] = false,
                ["<C-s>"] = actions.goto_file_selection_split,
                ["<CR>"] = actions.goto_file_selection_edit + actions.center,
                -- next | prev
                ["i"] = false,
                ["j"] = false,
                ["n"] = actions.move_selection_next,
                ["e"] = actions.move_selection_previous,
                -- use esc for exit no normal mode
                ["<esc>"] = actions.close
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
        prompt_position = "bottom",
        prompt_prefix = ">",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_defaults = {},
        file_sorter = require "telescope.sorters".get_fuzzy_file,
        file_ignore_patterns = {".git", ".node_modules"},
        generic_sorter = require "telescope.sorters".get_generic_fuzzy_sorter,
        shorten_path = true,
        winblend = 0,
        width = 0.75,
        preview_cutoff = 120,
        results_height = 1,
        results_width = 0.8,
        border = {},
        borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
        color_devicons = true,
        use_less = true,
        set_env = {["COLORTERM"] = "truecolor"}, -- default { }, currently unsupported for shells like cmd.exe / powershell.exe
        file_previewer = require "telescope.previewers".vim_buffer_cat.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_cat.new`
        grep_previewer = require "telescope.previewers".vim_buffer_vimgrep.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_vimgrep.new`
        qflist_previewer = require "telescope.previewers".vim_buffer_qflist.new -- For buffer previewer use `require'telescope.previewers'.vim_buffer_qflist.new`
    }
}

