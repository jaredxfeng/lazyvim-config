return {
  {
    "LazyVim/LazyVim",
    opts = {
      kind_filter = {
        default = {
          "Class",
          "Constructor",
          "Enum",
          "Field",
          "Function",
          "Interface",
          "Method",
          "Module",
          "Namespace",
          "Package",
          "Property",
          "Struct",
          "Trait",
          -- Add these two lines (or more if you want):
          "Variable",
          "Constant",
        },
        -- Optional: show *everything* for specific languages
        -- typescript = false,   -- or javascript, etc.
        -- lua = false,
      },
    },
  },
}
