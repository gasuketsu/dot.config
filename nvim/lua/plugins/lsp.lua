return {
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            { "williamboman/mason.nvim" },
            { "neovim/nvim-lspconfig" },
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "denols",
                    "gopls",
                    "gradle_ls",
                    "jdtls",
                    "jsonls",
                    "kotlin_language_server",
                    "pyright",
                    "svelte",
                    "tsserver",
                    "yamlls",
                },
                automatic_installation = true,
            })

            local on_attach = function(client, bufnr)
                -- things to be done only when LSP server attached
            end

            local capabilities = require("cmp_nvim_lsp").default_capabilities(
                vim.lsp.protocol.make_client_capabilities()
            )

            local lspconfig = require("lspconfig")
            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
                    })
                end,
                ["denols"] = function()
                    lspconfig.denols.setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
                        root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
                    })
                end,
                ["gopls"] = function()
                    lspconfig.gopls.setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
                        settings = { gopls = { gofumpt = true } },
                        root_dir = lspconfig.util.root_pattern("go.mod"),
                    })
                end,
                ["kotlin_language_server"] = function()
                    lspconfig.kotlin_language_server.setup({
                        settings = {
                            kotlin = { compiler = { jvm = { target = "21" } } },
                        },
                    })
                end,
                ["tsserver"] = function()
                    lspconfig.tsserver.setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
                        root_dir = lspconfig.util.root_pattern(
                            "package.json",
                            "tsconfig.json",
                            "jsconfig.json"
                        ),
                        single_file_support = false,
                    })
                end,
            })

            vim.lsp.handlers["textDocument/publishDiagnostics"] =
                vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
                    underline = true,
                    signs = true,
                })

            -- Sign Definition
            vim.fn.sign_define(
                "DiagnosticSignError",
                { text = " ", texthl = "DiagnosticSignError" }
            )
            vim.fn.sign_define(
                "DiagnosticSignWarn",
                { text = " ", texthl = "DiagnosticSignWarn" }
            )
            vim.fn.sign_define(
                "DiagnosticSignInfo",
                { text = " ", texthl = "DiagnosticSignInfo" }
            )
            vim.fn.sign_define(
                "DiagnosticSignHint",
                { text = " ", texthl = "DiagnosticSignHint" }
            )
        end,
    },
}
