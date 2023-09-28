return {
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            { "rafamadriz/friendly-snippets" },
        },
        build = "make install_jsregexp",
        config = function()
            require("luasnip").setup()
            require("luasnip.loaders.from_vscode").lazy_load({
                paths = { vim.fn.stdpath("data") .. "/lazy/friendly-snippets" },
            })
        end,
    },
}
