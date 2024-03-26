return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            -- providers
            "nvim-neotest/neotest-go", -- golang
            "nvim-neotest/neotest-python", -- python
            "mrcjkb/rustaceanvim", -- rust
            "marilari88/neotest-vitest", -- vitest
        },
        config = function()
            local neotest_ns = vim.api.nvim_create_namespace("neotest")
            vim.diagnostic.config({
                virtual_text = {
                    format = function(diagnostic)
                        local message = diagnostic.message
                            :gsub("\n", " ")
                            :gsub("\t", " ")
                            :gsub("%s+", " ")
                            :gsub("^%s+", "")
                        return message
                    end,
                },
            }, neotest_ns)

            require("neotest").setup({
                adapters = {
                    require("neotest-go"),
                    require("neotest-python"),
                    require("rustaceanvim.neotest"),
                    require("neotest-vitest"),
                },
            })
        end,
    },
}
