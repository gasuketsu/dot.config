return {
    -- golang
    {
        "crispgm/nvim-go",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("go").setup({
                auto_format = false,
                auto_lint = false,
                linter = "golangci-lint",
                linter_prompt_style = "vt",
                tags_options = {},
            })
        end,
    },
}
