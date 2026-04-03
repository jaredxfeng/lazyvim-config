return {
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim", -- ensure telescope is a hard dependency
    },
    opts = {
      picker = "telescope", -- force telescope (best preview support currently)
      -- Optional: suppress the projects v2 warning if you don't use Projects
      -- suppress_missing_scope = { projects_v2 = true },
    },
  },
}
