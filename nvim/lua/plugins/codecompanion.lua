return {
    {
        "olimorris/codecompanion.nvim",
        version = "^19.0.0",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            vim.g.codecompletion_auto_tool_mode = true
            require("codecompanion").setup({
                interactions = {
                    chat = {
                        adapter = {
                            name = "opencode",
                        },
                        opts = {
                            completion_provider = "blink",
                        },
                    },
                },
            })
        end,
    },
}
