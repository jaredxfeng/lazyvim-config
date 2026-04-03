return {
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional but nice for file icons
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },
    keys = {
      -- Toggle diffview (very convenient)
      {
        "<leader>gd",
        function()
          if next(require("diffview.lib").views) == nil then
            vim.cmd("DiffviewOpen")
          else
            vim.cmd("DiffviewClose")
          end
        end,
        desc = "Diffview: Toggle",
      },

      -- Open file history for current file
      { "<leader>gD", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview: File History (current file)" },

      -- Open file history for the whole repo
      { "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview: Repo History" },
    },
    opts = {
      -- You can add custom configuration here if you want (most people start with defaults)
      enhanced_diff_hl = true, -- nicer highlighting
      view = {
        default = { layout = "diff2_horizontal" }, -- or "diff2_vertical"
        merge_tool = { layout = "diff4_mixed" },
      },
    },
  },
}
