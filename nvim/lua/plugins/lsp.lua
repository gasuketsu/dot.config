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
                    "jsonls",
                    "lua_ls",
                    "pyright",
                    "rust_analyzer",
                    "svelte",
                    "ts_ls",
                    "yamlls",
                },
                automatic_installation = true,
            })

            local on_attach = function(_, _) -- client, bufnr
                vim.lsp.codelens.refresh()
            end

            -- local capabilities = require("cmp_nvim_lsp").default_capabilities(
            --     vim.lsp.protocol.make_client_capabilities()
            -- )
            -- if not capabilities.workspace then
            --     capabilities.workspace = {}
            -- end
            -- capabilities.workspace.didChangeWatchedFiles = {
            --     dynamicRegistration = true,
            -- }

            -- local lspconfig = require("lspconfig")
            vim.lsp.config("*", {
                root_markers = { ".git", ".hg" },
                on_attach = on_attach,
            })
            vim.lsp.config("gopls", {
                settings = {
                    gopls = {
                        gofumpt = true,
                        codelenses = {
                            generate = true,
                            gc_details = true,
                            test = true,
                            tidy = true,
                            vendor = false,
                            regenerate_cgo = true,
                            upgrade_dependency = true,
                        },
                    },
                },
            })
            vim.lsp.config("kotolin_language_server", {
                settings = {
                    kotlin = { compiler = { jvm = { target = "17" } } },
                },
            })
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                        },
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME,
                            },
                        },
                    },
                },
            })

            -- Diagnostic Configuration
            vim.diagnostic.config({
                signs = true,
                underline = true,
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

            vim.lsp.enable(require("mason-lspconfig").get_installed_servers())
        end,
    },
}
