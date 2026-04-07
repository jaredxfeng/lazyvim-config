return {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",  -- or "LspAttach"
  opts = {
    bind = true,  -- This is important for automatic triggering
    handler_opts = {
      border = "rounded",  -- or "single", "none", etc.
    },
    hint_enable = false,        -- Set to true if you prefer virtual text hints instead of floating window
    hint_prefix = "?? ",         -- Optional icon for virtual text
    always_trigger = false,     -- Only trigger on trigger characters (recommended)
    auto_close_after = nil,     -- Don't auto-close after X seconds
    extra_trigger_chars = { ",", "(" },  -- Explicitly trigger on comma too

    -- These make it feel more like VS Code / IntelliJ
    floating_window = true,
    floating_window_above_cur_line = true,
    floating_window_off_x = 0,
    floating_window_off_y = 0,

    -- Highlight the active (next) parameter
    hi_parameter = "LspSignatureActiveParameter",  -- Usually already styled nicely
  },
  config = function(_, opts)
    require("lsp_signature").setup(opts)

    -- Optional: Make sure it works well with noice.nvim (if you use it)
    vim.lsp.handlers["textDocument/signatureHelp"] = require("lsp_signature").signature_handler
  end,
}
