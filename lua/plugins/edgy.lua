-- ~/.config/nvim/lua/plugins/edgy.lua
return {
  "folke/edgy.nvim",
  opts = function(_, opts)
    -- Start fresh for the panels we care about to avoid duplicates
    opts.left = opts.left or {}
    opts.right = {}
    opts.bottom = opts.bottom or {}
    opts.top = opts.top or {}

    -- === Right sidebar: Chat (top) + Outline (bottom) ===
    table.insert(opts.right, {
      title = "Avante",
      ft = "Avante",
      size = { height = 0.6 },
      pinned = true,
      open = "AvanteToggle",
    })

    -- Avante Input box (right under the chat output)
    table.insert(opts.right, {
      title = "Input",
      ft = "AvanteInput",
      size = { height = 0.1 },
      pinned = true,
    })

    table.insert(opts.right, {
      title = "Outline",
      ft = "Outline",
      size = { height = 0.3 },
      pinned = true,
      open = "Outline",
    })

    -- Global sizes
    opts.options = vim.tbl_deep_extend("force", opts.options or {}, {
      right = { size = 40 }, -- width of right sidebar
      bottom = { size = 20 }, -- base height for bottom panel
    })

    return opts
  end,
}
