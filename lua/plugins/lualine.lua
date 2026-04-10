return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.sections = opts.sections or {}
    opts.sections.lualine_x = vim.list_extend(
      opts.sections.lualine_x or {},
      { require("brain-soc").lualine_component() }
    )
    return opts
  end,
}
