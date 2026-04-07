-- ~/.config/nvim/lua/plugins/edgy.lua
return {
  "folke/edgy.nvim",
  opts = function(_, opts)
    -- Change default size for the Snacks terminal (<C-/>)
    local new_size = { height = 0.2 } -- ← CHANGE THIS: 0.3 = 30%, 15 = fixed 15 lines, etc.

    for _, pos in ipairs({ "bottom", "top", "left", "right" }) do
      opts[pos] = opts[pos] or {}
      for _, panel in ipairs(opts[pos]) do
        if panel.ft == "snacks_terminal" then
          panel.size = new_size
          break
        end
      end
    end
    -- Start fresh for the panels we care about to avoid duplicates
    opts.left = opts.left or {}
    opts.right = {}
    opts.bottom = opts.bottom or {}
    opts.top = opts.top or {}

    -- === Right sidebar: Chat (top) + Outline (bottom) ===
    table.insert(opts.right, {
      title = "Avante",
      ft = "Avante",
      size = { height = 0.5 },
      pinned = true,
      open = "AvanteToggle",
    })

    table.insert(opts.right, {
      title = "Selected Files",
      ft = "AvanteSelectedFiles",
      size = { height = 14 },
      pinned = true,
    })

    -- Avante Input box (right under the chat output)
    table.insert(opts.right, {
      title = "Input",
      ft = "AvanteInput",
      size = { height = 4 },
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
    })

    return opts
  end,
}
