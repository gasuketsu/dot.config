return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            { "nvim-treesitter/nvim-treesitter-context" },
            { "windwp/nvim-ts-autotag" },
            { "JoosepAlviste/nvim-ts-context-commentstring" },
        },
        lazy = false,
        branch = "main",
        build = ":TSUpdate",
        config = function()
            local langs = {
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
                "hjson",
                "html",
                "java",
                "javascript",
                "json",
                "kotlin",
                "lua",
                "make",
                "markdown",
                "markdown_inline",
                "meson",
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
                "vimdoc",
                "yaml",
                "zsh",
            }
            local langs_indent = {
                "cmake",
                "comment",
                "css",
                "gomod",
                "groovy",
                "hjson",
                "html",
                "java",
                "javascript",
                "json",
                "lua",
                "markdown",
                "meson",
                "proto",
                "python",
                "rust",
                "scss",
                "svelte",
                "toml",
                "tsx",
                "typescript",
                "yaml",
            }
            require("nvim-treesitter").install(langs)

            local group = vim.api.nvim_create_augroup("vim-treesitter-start", { clear = true })
            vim.api.nvim_create_autocmd("FileType", {
                group = group,
                pattern = langs,
                callback = function(args)
                    vim.treesitter.start(args.buf)
                end,
            })

            vim.api.nvim_create_autocmd("FileType", {
                group = group,
                pattern = langs_indent,
                callback = function(_)
                    vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
                end,
            })

            require("treesitter-context").setup()
            require("ts_context_commentstring").setup({
                enable_autocmd = false,
            })
        end,
    },
}
