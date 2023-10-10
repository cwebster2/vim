return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  lazy = true,
  config = function ()
    require("nvim-treesitter.configs").setup({
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["a="] = { query = "@assignment.outer", desc = "Select outer part of assignment" },
            ["i="] = { query = "@assignment.inner", desc = "Select inner part of assignment" },
            ["l="] = { query = "@assignment.lhs", desc = "Select left hand side of assignment" },
            ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of assignment" },

            ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument"},
            ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument"},

            ["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional"},
            ["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional"},

            ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop"},
            ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop"},

            ["af"] = { query = "@call.outer", desc = "Select outer part of a call"},
            ["if"] = { query = "@call.inner", desc = "Select inner part of a call"},

            ["am"] = { query = "@function.outer", desc = "Select outer part of a function"},
            ["im"] = { query = "@function.inner", desc = "Select inner part of a function"},

            ["ac"] = { query = "@class.outer", desc = "Select outer part of a class"},
            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class"},
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>na"] = "@parameter.inner",
            ["<leader>ni"] = "@conditional.inner",
            ["<leader>nl"] = "@loop.inner",
            ["<leader>nf"] = "@call.inner",
            ["<leader>nm"] = "@function.outer",
            ["<leader>nc"] = "@class.inner",
          },
          swap_previous = {
            ["<leader>pa"] = "@parameter.inner",
            ["<leader>pi"] = "@conditional.inner",
            ["<leader>pl"] = "@loop.inner",
            ["<leader>pf"] = "@call.inner",
            ["<leader>pm"] = "@function.outer",
            ["<leader>pc"] = "@class.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]f"] = { query = "@call.outer", desc = "Next function call start" },
            ["]m"] = { query = "@function.outer", desc = "Next function def start" },
            ["]c"] = { query = "@class.outer", desc = "Next class start" },
            ["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
            ["]l"] = { query = "@loop.outer", desc = "Next loop start" },
            ["]a"] = { query = "@parameter.outer", desc = "Next function parameter start" },

            ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
            ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
          },
          goto_next_end = {
            ["]F"] = { query = "@call.outer", desc = "Next function call end" },
            ["]M"] = { query = "@function.outer", desc = "Next function def end" },
            ["]C"] = { query = "@class.outer", desc = "Next class end" },
            ["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
            ["]L"] = { query = "@loop.outer", desc = "Next loop end" },
            ["]A"] = { query = "@parameter.outer", desc = "Next function parameter end" },
          },
          goto_previous_start = {
            ["[f"] = { query = "@call.outer", desc = "Prev function call start" },
            ["[m"] = { query = "@function.outer", desc = "Prev function def start" },
            ["[c"] = { query = "@class.outer", desc = "Prev class start" },
            ["[i"] = { query = "@conditional.outer", desc = "Prev conditional start" },
            ["[l"] = { query = "@loop.outer", desc = "Prev loop start" },
            ["[a"] = { query = "@parameter.outer", desc = "Prev function parameter start" },
          },
          goto_previous_end = {
            ["[F"] = { query = "@call.outer", desc = "Prev function call end" },
            ["[M"] = { query = "@function.outer", desc = "Prev function def end" },
            ["[C"] = { query = "@class.outer", desc = "Prev class end" },
            ["[I"] = { query = "@conditional.outer", desc = "Prev conditional end" },
            ["[L"] = { query = "@loop.outer", desc = "Prev loop end" },
            ["[A"] = { query = "@parameter.outer", desc = "Prev function parameter end" },
          }
        }
      },
    })

    local tpm = require("nvim-treesitter.textobjects.repeatable_move")
    vim.keymap.set({ "n", "x", "o" }, ";", tpm.repeat_last_move)
    vim.keymap.set({ "n", "x", "o" }, ",", tpm.repeat_last_move_opposite)

    -- do I like these?
    vim.keymap.set({ "n", "x", "o" }, "f", tpm.builtin_f)
    vim.keymap.set({ "n", "x", "o" }, "F", tpm.builtin_F)
    vim.keymap.set({ "n", "x", "o" }, "t", tpm.builtin_t)
    vim.keymap.set({ "n", "x", "o" }, "T", tpm.builtin_T)
  end
}
