return {
  {
    "mg979/vim-visual-multi",
    branch = "master",
    lazy = false, -- load early so mappings are available immediately
    init = function()
      -- Optional: Remap "Find Under" (next matching word) to Ctrl+D like VS Code
      -- (default is <C-n> - many people keep the default to avoid conflicting with <C-d> = half-page down)
      vim.g.VM_maps = {
        ["Find Under"] = "<C-d>",          -- Ctrl+D  add next occurrence
        -- ["Find Under"] = "<C-n>",       -- keep original if you prefer
        -- ["Add Cursor Down"] = "<C-j>",  -- optional vertical cursors
        -- ["Add Cursor Up"]   = "<C-k>",
      }
    end,
  },
}
