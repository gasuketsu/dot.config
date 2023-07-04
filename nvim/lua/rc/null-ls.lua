local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.fish_indent,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.stylua,
  },
})
