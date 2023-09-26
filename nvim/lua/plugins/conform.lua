return {
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          c = { "clang-format" },
          cpp = { "clang-format" },
          css = { "pretter" },
          fish = { "fish_indent" },
          go = { "gofumpt", "goimports" },
          html = { "prettier" },
          javascript = { "prettier" },
          javascriptreact = { "prettier" },
          json = { "prettier" },
          lua = { "stylua" },
          markdown = { "prettier" },
          python = { "black" },
          rust = { "rustfmt" },
          sh = { "shfmt" },
          typescript = { "prettier" },
          typescriptreact = { "prettier" },
          yaml = { "prettier" },
          ["_"] = { "trim_whitespace" },
        },
        format_on_save = {
          lsp_fallback = "always",
          timeout_ms = 1000,
        },
      })
    end,
  },
}
