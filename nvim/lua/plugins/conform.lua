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
                    go = { "gofumpt", "goimports" },
                    html = { "prettier" },
                    javascript = { "biome" },
                    javascriptreact = { "biome" },
                    json = { "biome" },
                    lua = { "stylua" },
                    markdown = { "prettier" },
                    python = { "ruff_format" },
                    rust = { "rustfmt" },
                    sh = { "shfmt" },
                    typescript = { "biome" },
                    typescriptreact = { "biome" },
                    yaml = { "yamlfmt" },
                    zsh = { "shfmt" },
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
