return {
    {
        "brenoprata10/nvim-highlight-colors",
        config = function()
            require("nvim-highlight-colors").setup({
                render = "virtual",
                virtual_symbol_position = "eol",
            })
            require("nvim-highlight-colors").turnOff()
        end,
    },
}
