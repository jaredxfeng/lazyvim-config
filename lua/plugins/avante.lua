return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    opts = {
      behaviour = {
        auto_suggestions = false,
      },
      auto_suggestions_provider = nil,
      windows = {
        position = "right",
        input = {
          height = 3,
          prefix = "> ",
        },
        selected_files = {
          height = 10,
        },
        ask = {
          floating = true,
          start_insert = true,
          border = "rounded",
        }
      },
      provider = "xai",  -- set as default
      providers = {
        xai = {
          __inherited_from = "openai",
          endpoint = "https://api.x.ai/v1",
          model = "grok-code-fast-1",     -- fast & cheap coding model
          -- model = "grok-4",            -- or use the flagship if you want max power
          api_key_name = "XAI_API_KEY",
          -- Optional tweaks
          temperature = 0.2,
          max_tokens = 8192,
        },
      },
    },
    -- your existing build/dependencies stay the same
  },
  { "saghen/blink-cmp-avante", enabled = false },
}
