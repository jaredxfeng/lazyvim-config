-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("tsc").setup({
  flags = {
    watch = true,
  },
})
