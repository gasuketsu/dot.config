require("formatter").setup({
  filetype = {
    css = {
      require("formatter.filetypes.css").prettier,
    },
    go = {
      function()
        return {
          exe = "golines",
          stdin = true,
        }
      end,
    },
    html = {
      require("formatter.filetypes.html").prettier,
    },
    javascript = {
      require("formatter.filetypes.javascript").prettier,
    },
    json = {
      require("formatter.filetypes.json").prettier,
    },
    lua = {
      require("formatter.filetypes.lua").stylua,
    },
    python = {
      require("formatter.filetypes.python").black,
    },
    rust = {
      require("formatter.filetypes.rust").rustfmt,
    },
    typescript = {
      require("formatter.filetypes.typescript").prettier,
    },
    yaml = {
      require("formatter.filetypes.yaml").prettier,
    },
  },
})

vim.keymap.set("n", "<A-f>", "<cmd>Format<CR>", { silent = true })
