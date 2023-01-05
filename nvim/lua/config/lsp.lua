-- LSP-colors
require("lsp-colors").setup()

-- Language servers to be installed
local servers = {
  gopls = { settings = { gopls = { gofumpt = true } } },
  jsonls = {},
  pyright = {},
  svelte = {},
  tsserver = {},
  yamlls = {},
}

require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
})

local on_attach = function(client, bufnr)
  -- things to be done only when LSP server attached
  require("lsp_signature").on_attach({ hint_prefix = " " })
end

local capabilities =
  require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- setup servers and map buffer local keybindings when the language server attaches
local lspconfig = require("lspconfig")
for k, v in pairs(servers) do
  lspconfig[k].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = v.settings,
  })
end

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    underline = true,
    signs = true,
  })

-- Sign Definition
vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
