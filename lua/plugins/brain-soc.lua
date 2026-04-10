-- ~/.config/nvim/lua/plugins/brain-soc.lua
return {
  "jaredxfeng/brain-soc.nvim",
  dependencies = {
    { "nvim-lualine/lualine.nvim", optional = true },
  },
  opts = {
    capacity_minutes = 400,
    drain_rate = 1.1,
    coding_threshold_minutes = 3,
    recharge_minutes_per_break = 25,
  },
  lazy = false,
  config = function(_, opts)
    require("brain-soc")._opts = opts -- pass opts to the module
  end,
}
