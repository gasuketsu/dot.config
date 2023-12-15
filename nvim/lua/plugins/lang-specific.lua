return {
    -- python
    {
        "Vimjas/vim-python-pep8-indent",
    },
    -- golang
    {
        "ray-x/go.nvim",
        dependencies = {
            "ray-x/guihua.lua",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("go").setup({
                tag_transform = "snakecase",
            })
        end,
        ft = { "go", "gomod" },
    },
}
