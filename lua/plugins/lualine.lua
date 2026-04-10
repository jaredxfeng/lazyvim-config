return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.sections = opts.sections or {}
    opts.sections.lualine_x = opts.sections.lualine_x or {}

    -- Super safe Brain SOC component (right side, next to clock)
    table.insert(opts.sections.lualine_x, {
      function()
        local ok, status = pcall(require("brain-soc").get_status)
        return ok and status or "🧠 ERR"
      end,
      cond = function()
        return vim.fn.filereadable(vim.fn.expand("~/.brain-soc.json")) == 1
      end,
    })

    return opts
  end,
}
