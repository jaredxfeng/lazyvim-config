-- ~/.config/nvim/lua/plugins/brain-soc.lua
return {
  "jaredxfeng/brain-soc.nvim",   -- ← CHANGE THIS if your repo is somewhere else
  opts = {
    capacity_minutes = 5000,
    drain_rate = 1.1,
    coding_threshold_minutes = 3,
    recharge_minutes_per_break = 25,
  },
  lazy = false,                         -- load immediately on startup
  config = function(_, opts)
    require("brain-soc")._opts = opts   -- pass opts to the module
  end,
}
