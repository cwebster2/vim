return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
  config = function()
    require("avante").setup({
      windows = {
        width = 40,
      },
      --- @class AvanteFileSelectorConfig
      file_selector = {
        provider = "snacks",
        -- Options override for custom providers
        provider_opts = {},
      },
      selector = {
        ---@alias avante.SelectorProvider "native" | "fzf_lua" | "mini_pick" | "snacks" | "telescope" | fun(selector: avante.ui.Selector): nil
        provider = "telescope",
        provider_opts = {},
      },
      -- other config
      -- The system_prompt type supports both a string and a function that returns a string. Using a function here allows dynamically updating the prompt with mcphub
      -- cursor_applying_provider = 'ollama',
      behaviour = {
        enable_cursor_planning_mode = true,
        enable_claude_text_editor_tool_mode = true,
      },
      provider = "copilot",
      copilot = {
        model = "claude-3.7-sonnet",
      },
      ollama = {
        model = "qwen2.5-coder:7b",
      },
      rag_service = {
        enabled = false, -- Enables the RAG service
        host_mount = os.getenv("HOME") .. "/github", -- Host mount path for the rag service (subfolder under home)
        provider = "ollama", -- The provider to use for RAG service (e.g. openai or ollama)
        llm_model = "deepseek-r1:8b",
        endpoint = "http://localhost:11434", -- The API endpoint for RAG service
      },
      -- system_prompt = function()
      --   local hub = require("mcphub").get_hub_instance()
      --   return hub:get_active_servers_prompt()
      -- end,
      --The custom_tools type supports both a list and a function that returns a list. Using a function here prevents requiring mcphub before it's loaded
      -- custom_tools = function()
      --   return {
      --     require("mcphub.extensions.avante").mcp_tool(),
      --   }
      -- end,
    })
  end,
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    -- "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
