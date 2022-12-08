require("null-ls").setup({
  sources = {
    require("null-ls").builtins.formatting.black,
    require("null-ls").builtins.formatting.golines,
    require("null-ls").builtins.formatting.prettierd.with({
      extra_filetypes = { "svelte" },
    }),
    require("null-ls").builtins.formatting.stylua,
    require("null-ls").builtins.formatting.rustfmt,
  },
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})

vim.keymap.set("n", "<A-f>", vim.lsp.buf.format, { silent = true })
