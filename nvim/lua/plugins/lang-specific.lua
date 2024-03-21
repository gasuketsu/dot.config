return {
    -- python
    {
        "Vimjas/vim-python-pep8-indent",
    },
    -- golang
    {
        "crispgm/nvim-go",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("go").setup({
                auto_format = false,
                tags_options = {},
            })
        end,
    },
}
