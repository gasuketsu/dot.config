return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            { "nvim-treesitter/nvim-treesitter-context" },
            { "windwp/nvim-ts-autotag" },
            { "JoosepAlviste/nvim-ts-context-commentstring" },
        },
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        config = function()
            require("nvim-treesitter.configs").setup({
                -- A list of parser names, or "all"
                ensure_installed = {
                    "bash",
                    "c",
                    "cmake",
                    "comment",
                    "cpp",
                    "css",
                    "dockerfile",
                    "fish",
                    "go",
                    "gomod",
                    "groovy",
                    "html",
                    "java",
                    "javascript",
                    "json",
                    "jsonc",
                    "kotlin",
                    "lua",
                    "make",
                    "markdown",
                    "markdown_inline",
                    "proto",
                    "python",
                    "regex",
                    "rust",
                    "scss",
                    "svelte",
                    "toml",
                    "tsx",
                    "typescript",
                    "vim",
                    "yaml",
                },
                ignore_install = {}, -- List of parsers to ignore installing
                highlight = {
                    enable = true, -- false will disable the whole extension
                    disable = { "elixir" }, -- list of language that will be disabled
                },
                autotag = {
                    enable = true,
                },
            })

            require("treesitter-context").setup()
            require("ts_context_commentstring").setup({
                enable_autocmd = false,
            })
        end,
    },
}
