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
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = " ",
                        [vim.diagnostic.severity.WARN] = " ",
                        [vim.diagnostic.severity.INFO] = " ",
                        [vim.diagnostic.severity.HINT] = " ",
                    },
                },
                underline = true,
            })
            vim.lsp.enable(require("mason-lspconfig").get_installed_servers())
        end,
    },
}
