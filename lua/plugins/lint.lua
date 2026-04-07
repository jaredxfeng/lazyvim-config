return {
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        markdown = false,  -- or {} to disable completely
      },
    },
  },
}
