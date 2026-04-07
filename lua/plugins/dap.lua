return {
  "mfussenegger/nvim-dap",
  opts = function()
    local function pick_script()
      local pilot = require("package-pilot")

      local current_dir = vim.fn.getcwd()
      local package = pilot.find_package_file({ dir = current_dir })

      if not package then
        vim.notify("No package.json found", vim.log.levels.ERROR)
        return require("dap").ABORT
      end

      local scripts = pilot.get_all_scripts(package)

      local label_fn = function(script)
        return script
      end

      local co, ismain = coroutine.running()
      local ui = require("dap.ui")
      local pick = (co and not ismain) and ui.pick_one or ui.pick_one_sync
      local result = pick(scripts, "Select script", label_fn)
      return result or require("dap").ABORT
    end

    local dap = require("dap")

    -- Your Jest Current File config (equivalent to your VS Code launch.json)
    -- We use pwa-node (the modern replacement for the old "node" type)
    table.insert(dap.configurations.typescript or {}, {
      type = "pwa-node",
      request = "launch",
      name = "Debug Jest Current File",
      runtimeExecutable = "${workspaceFolder}/node_modules/.bin/jest", -- or full path to jest if you prefer
      runtimeArgs = { "--runInBand", "${file}" },
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
      sourceMaps = true,
      skipFiles = { "<node_internals>/**", "node_modules/**" },
      resolveSourceMapLocations = {
        "${workspaceFolder}/**",
        "!**/node_modules/**",
      },
    })

    -- Dynamic package.json script picker (the main thing from the guide)
    table.insert(dap.configurations.typescript or {}, {
      type = "pwa-node",           -- use pwa-node for best TS support
      request = "launch",
      name = "pick script (npm)",
      runtimeExecutable = "npm",   -- change to "pnpm" or "yarn" if you use those
      runtimeArgs = { "run", pick_script },
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
      skipFiles = { "<node_internals>/**", "node_modules/**" },
      sourceMaps = true,
    })
    -- Optional: also support .ts files that use tsx/ts-node (already in LazyVim defaults)
  end,
  dependencies = {
    {
      "banjo/package-pilot.nvim",
    },
  },
}
