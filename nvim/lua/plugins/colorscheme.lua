return {
    {
        "rebelot/kanagawa.nvim",
        priority = 1000,
        lazy = false,
        config = function()
            require("kanagawa").setup({
                compile = true,
                keywordStyle = { italic = false },
                colors = {
                    palette = {
                        samuraiRed = "#ff5d62", -- peachRed
                    },
                },
                terminalColors = false,
                theme = "wave",
                background = {
                    dark = "wave",
                    light = "lotus",
                },
            })
            vim.g.kanagawa_lualine_bold = true

            vim.cmd("colorscheme kanagawa")
        end,
    },
}
