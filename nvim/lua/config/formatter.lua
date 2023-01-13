-- Utilities for creating configurations
local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
  logging = true,
  log_level = vim.log.levels.ERROR,
  filetype = {
    c = {
      require("formatter.filetypes.c").clangformat,
    },
    cpp = {
      require("formatter.filetypes.cpp").clangformat,
    },
    css = {
      require("formatter.filetypes.css").prettier,
    },
    fish = {
      require("formatter.filetypes.fish").fishindent,
    },
    go = {
      require("formatter.filetypes.go").gofumpt,
    },
    html = {
      require("formatter.filetypes.html").prettier,
    },
    javascript = {
      require("formatter.filetypes.javascript").prettier,
    },
    javascriptreact = {
      require("formatter.filetypes.javascriptreact").prettier,
    },
    json = {
      require("formatter.filetypes.json").prettier,
    },
    lua = {
      require("formatter.filetypes.lua").stylua,
    },
    markdown = {
      require("formatter.filetypes.markdown").prettier,
    },
    python = {
      require("formatter.filetypes.python").black,
    },
    rust = {
      require("formatter.filetypes.rust").rustfmt,
    },
    sh = {
      require("formatter.filetypes.sh").shfmt,
    },
    svelte = {
      require("formatter.filetypes.svelte").prettier,
    },
    typescript = {
      require("formatter.filetypes.typescript").prettier,
    },
    typescriptreact = {
      require("formatter.filetypes.typescriptreact").prettier,
    },
    yaml = {
      require("formatter.filetypes.yaml").prettier,
    },
  },
})
