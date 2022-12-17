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
  rust_analyzer = {},
}

require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
})

local on_attach = function(client, bufnr)
  -- Keymaps
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  require("lsp_signature").on_attach({ hint_prefix = " " })

  local opts = { noremap = true, silent = true }
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "gh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  -- following keymaps depend on telescope
  buf_set_keymap("n", "gd", "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>", opts)
  buf_set_keymap(
    "n",
    "<leader>o",
    "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>",
    opts
  )
  buf_set_keymap(
    "n",
    "<leader>O",
    "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>",
    opts
  )
  buf_set_keymap(
    "n",
    "<leader>a",
    "<cmd>lua require('telescope.builtin').lsp_code_actions()<CR>",
    opts
  )
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
