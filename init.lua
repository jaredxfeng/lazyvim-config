-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("tsc").setup({
  flags = {
    watch = true,
  },
})

-- The Brain SOC config
require("brain-soc").update_config({
  capacity_minutes = 300,
})
