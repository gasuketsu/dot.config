local path = require("nvim-lsp-installer.core.path")
local install_root_dir = path.concat({ vim.fn.stdpath("data"), "lsp_servers" })

require("go").setup({
  gopls_cmd = { install_root_dir .. "/gopls/gopls" },
  tag_transform = "camelcase",
})
