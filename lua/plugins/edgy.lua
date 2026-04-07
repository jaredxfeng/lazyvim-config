-- ~/.config/nvim/lua/plugins/edgy.lua
return {
  "folke/edgy.nvim",
  opts = function(_, opts)
    opts.animate = { enabled = false }

    -- Change default size for the Snacks terminal (<C-/>)
    local new_size = { height = 0.2 } -- ← CHANGE THIS: 0.3 = 30%, 15 = fixed 15 lines, etc.

    for _, panel in ipairs(opts.bottom or {}) do
      if type(panel) == "table" then
        if panel.ft == "snacks_terminal"
            or panel.ft == "noice"
            or panel.ft == "trouble"
            or panel.title == "Trouble" then
          panel.size = new_size
        end
      end
    end

-- 2. Also anchor the entire bottom edgebar (this is what stops the container from expanding)
    opts.options = opts.options or {}
    opts.options.bottom = { size = new_size.height } -- use the same fraction/number you chose above

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
