return {
    {
        "olimorris/codecompanion.nvim",
        version = "^19.0.0",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = function(_, opts)
            local base_opts = {}
            local env_opts = require("env.codecompanion").opts
            return vim.tbl_deep_extend("force", opts, base_opts, env_opts)
        end,
    },
}
