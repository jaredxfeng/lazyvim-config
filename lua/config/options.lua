-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
-- Fix clipboard for WSL (bypass Wayland error)

-- Allow project-local .nvim.lua files (and remember trust)
vim.opt.exrc = false -- Allow .nvim.lua files in project roots
vim.opt.secure = true

vim.g.autoformat = false

if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "win32yank",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 0,
  }

  -- Yank to Windows system clipboard (on demand — normal y/yy stays internal + instant)
  vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
  vim.keymap.set({ "n", "v" }, "<leader>Y", '"+Y', { desc = "Yank line to system clipboard" })
end

vim.opt.clipboard = ""

-- Github Authentication
-- Try to get GH_TOKEN from gh CLI if not already set
if not vim.env.GH_TOKEN then
  local handle = io.popen("gh auth token 2>/dev/null")
  if handle then
    local token = handle:read("*a"):gsub("%s+", "")
    handle:close()
    if token and token ~= "" then
      vim.env.GH_TOKEN = token
    end
  end
end
