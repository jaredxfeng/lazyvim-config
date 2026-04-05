return {
  {
    "catppuccin/nvim",
    name = "catppuccin",          -- keep this (plugin name)
    priority = 1000,
    opts = {
      transparent_background = true,
      float = {
        transparent = true,
        solid = false,
      },
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

  -- Keep transparent.nvim (it will now work perfectly)
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      groups = {
        "Normal", "NormalNC", "NormalFloat", "FloatBorder",
        "SignColumn", "EndOfBuffer",
        "SnacksNormal", "SnacksNormalNC",
        "SnacksPicker", "SnacksPickerBorder",
        "WhichKeyFloat", "Pmenu", "PmenuSel", "WinSeparator",
      },
    },
  },
}
