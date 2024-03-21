return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = {
            "williamboman/mason.nvim",
        },
        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = {
                    -- golang
                    "gofumpt",
                    "goimports",
                    "gomodifytags",
                    "gotests",
                    "iferr",
                    "impl",
                },
            })
        end,
    },
}
