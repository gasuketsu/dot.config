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
      require("formatter.filetypes.css").prettierd,
    },
    fish = {
      require("formatter.filetypes.fish").fishindent,
    },
    go = {
      require("formatter.filetypes.go").gofumpt,
    },
    html = {
      require("formatter.filetypes.html").prettierd,
    },
    javascript = {
      require("formatter.filetypes.javascript").prettierd,
    },
    javascriptreact = {
      require("formatter.filetypes.javascriptreact").prettierd,
    },
    json = {
      require("formatter.filetypes.json").prettierd,
    },
    lua = {
      require("formatter.filetypes.lua").stylua,
    },
    markdown = {
      require("formatter.filetypes.markdown").prettierd,
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
      require("formatter.filetypes.typescript").prettierd,
    },
    typescriptreact = {
      require("formatter.filetypes.typescriptreact").prettierd,
    },
    yaml = {
      require("formatter.filetypes.yaml").prettierd,
    },
  },
})

vim.keymap.set("n", "<A-f>", "<cmd>Format<CR>", { silent = true })