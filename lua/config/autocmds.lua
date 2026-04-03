-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Auto-trust .nvim.lua in known safe projects (add your repo path)
local safe_projects = {
  vim.fn.expand("~/repos/ebc1"), -- change to your actual repo path
  vim.fn.expand("~/repos/sunesis"), -- change to your actual repo path
  -- add more if needed
}

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*/.nvim.lua",
  callback = function()
    local filepath = vim.fn.expand("%:p")
    local dir = vim.fn.fnamemodify(filepath, ":h")

    if vim.tbl_contains(safe_projects, dir) then
      -- Trust it silently if it matches our safe list
      vim.secure.trust({ action = "allow", path = filepath })
      -- Optional: notify once
      -- vim.notify("Auto-trusted project .nvim.lua", vim.log.levels.INFO)
    end
  end,
})
