return {
    {
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    c = { "clang-format" },
                    cpp = { "clang-format" },
                    css = { "prettier" },
                    fish = { "fish_indent" },
                    go = { "goimports" },
                    html = { "prettier" },
                    javascript = { "prettier" },
                    javascriptreact = { "prettier" },
                    json = { "prettier" },
                    kotlin = { "ktlint" },
                    lua = { "stylua" },
                    markdown = { "prettier" },
                    python = { "ruff_format" },
                    rust = { "rustfmt" },
                    sh = { "shfmt" },
                    typescript = { "prettier" },
                    typescriptreact = { "prettier" },
                    yaml = { "prettier" },
                    ["_"] = { "trim_whitespace" },
                },
                format_on_save = {
                    lsp_fallback = true,
                    timeout_ms = 1000,
                },
            })
        end,
    },
}
