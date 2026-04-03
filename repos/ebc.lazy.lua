-- Configs for the NeoVim IDE. Mostly equivalent to our .vscode/settings.json

-- Global editor settings (these now apply correctly)
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.list = true
vim.opt.listchars:append({ trail = ".", nbsp = "?" }) -- like VS Code "renderWhitespace": "boundary"

vim.opt.colorcolumn = "140"

vim.g.autoformat = false -- matches "editor.formatOnSave": true

vim.opt.fileencoding = "utf-8"
vim.opt.fixendofline = true

-- Exceptions for HTML and CSV (exactly like your [html] and [csv] sections)
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "html", "csv" },
	callback = function()
		vim.opt_local.fixendofline = false
	end,
})

-- Force 4-space indentation for YAML/yml (so Tab key and auto-indent use 4 spaces)
-- This overrides the common 2-space default that yaml ftplugin / yamlls / prettier try to force
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "yaml", "yml" },   --  this was the bug (you used a glob instead of filetype names)
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true

    vim.b.autoformat = false      -- keep autoformat off for YAML (global setting is respected)
  end,
})

-- Search excludes (works with Telescope / :grep)
vim.opt.wildignore:append({ "build/**", "node_modules/**" })

-- TypeScript: use the project's own typescript version
return {
	{
		"stevearc/conform.nvim",
		opts = function(_, opts)
			opts.formatters_by_ft = opts.formatters_by_ft or {}
			opts.formatters_by_ft.yaml = { "prettier" } -- prefer prettier for yaml
			opts.formatters_by_ft.yml = { "prettier" }

			-- Force prettier to use 4 spaces globally (affects yaml, json, etc.)
			opts.formatters = opts.formatters or {}
			opts.formatters.prettier = {
				prepend_args = { "--tab-width", "4" },
			}
		end,
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				ts_ls = {
					settings = {
						typescript = {
							tsdk = "node_modules/typescript/lib",
						},
					},
				},
			},
		},
	},
}
