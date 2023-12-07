return {
    {
        "rebelot/kanagawa.nvim",
        priority = 1000,
        lazy = false,
        config = function()
            require("kanagawa").setup({
                keywordStyle = { italic = false },
                colors = {
                    palette = {
                        samuraiRed = "#ff5d62", -- peachRed
                    },
                },
                terminalColors = false,
                theme = "dragon",
                background = {
                    dark = "dragon",
                    light = "lotus",
                },
            })
            vim.g.kanagawa_lualine_bold = true

            vim.cmd("colorscheme kanagawa")
        end,
    },
}
