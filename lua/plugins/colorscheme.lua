return {
  {
    "catppuccin/nvim",
    name = "catppuccin",          -- keep this (plugin name)
    priority = 1000,
    opts = {
      integrations = {
        snacks = true,
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-nvim",   --  THIS IS THE FIX (was "catppuccin")
    },
  },
}
