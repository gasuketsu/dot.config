return {
    -- python
    {
        "Vimjas/vim-python-pep8-indent",
    },
    -- golang
    {
        "olexsmir/gopher.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "mfussenegger/nvim-dap",
        },
        config = function()
            require("gopher").setup({
                gotests = {
                    template = "default",
                },
            })
            require("gopher.dap").setup()
        end,
    },
}
