return {
    {
        "wsdjeg/rooter.nvim",
        config = function()
            require("rooter").setup({
                root_patterns = { ".git/", ".hg/" },
            })
        end,
    },
}
