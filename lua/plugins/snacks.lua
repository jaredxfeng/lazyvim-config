return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          files = {
            exclude = {
              "**/.git",
              "**/node_modules",
            },
            ignored = true,
          },
          grep = {
            ignored = true,
            exclude = {
              "**/.git",
              "**/node_modules",
            },
          },
          explorer = {
            hidden = true,
            ignored = true,
            exclude = {
              "**/node_modules",
              "**/.git",
            },
          },
        },
      },
      explorer = {
        replace_netrw = false, -- ← this prevents auto-open on startup
      },
      scroll = { enabled = false },
    },
  },
}
