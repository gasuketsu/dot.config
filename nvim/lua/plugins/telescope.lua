return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "cljoly/telescope-repo.nvim",
        },
        config = function()
            local actions = require("telescope.actions")
            require("telescope").setup({
                defaults = {
                    mappings = {
                        n = {
                            ["d"] = actions.delete_buffer,
                        },
                        i = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                        },
                    },
                },
                extensions = {
                    repo = {
                        settings = {
                            auto_lcd = true,
                        },
                    },
                },
            })
            require("telescope").load_extension("repo")
        end,
    },
}
