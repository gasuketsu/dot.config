return {
    {
        "saghen/blink.cmp",
        dependencies = {
            {
                "zbirenbaum/copilot.lua",
                config = function()
                    require("copilot").setup({
                        suggestion = { enabled = false },
                        panel = { enabled = false },
                    })
                end,
            },
            "giuxtaposition/blink-cmp-copilot",
        },
        version = "*",
        opts = {
            keymap = {
                preset = "none",
                ["<C-i>"] = { "show", "show_documentation", "hide_documentation" },
                ["<Esc>"] = {
                    function(cmp)
                        if cmp.is_visible() then
                            return cmp.hide()
                        end
                    end,
                    "fallback",
                },
                ["<C-e>"] = { "hide", "fallback" },
                ["<CR>"] = { "accept", "fallback" },
                ["<Up>"] = { "select_prev", "fallback" },
                ["<Down>"] = { "select_next", "fallback" },
                ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
                ["<C-n>"] = {
                    function(cmp)
                        if not cmp.is_visible() then
                            return cmp.show()
                        end
                    end,
                    "select_next",
                    "fallback_to_mappings",
                },
                ["<C-b>"] = { "scroll_documentation_up", "fallback" },
                ["<C-f>"] = { "scroll_documentation_down", "fallback" },
                ["<Tab>"] = { "snippet_forward", "fallback" },
                ["<S-Tab>"] = { "snippet_backward", "fallback" },
                ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
            },
            cmdline = {
                keymap = {
                    ["<Tab>"] = {
                        function(cmp)
                            if cmp.is_menu_visible() then
                                return cmp.select_next()
                            end
                        end,
                        "show",
                        "accept",
                    },
                    ["<CR>"] = { "select_and_accept", "fallback" },
                },
                completion = {
                    ghost_text = {
                        enabled = false,
                    },
                    list = {
                        selection = { preselect = false },
                    },
                },
            },
            completion = {
                list = {
                    selection = { preselect = false },
                },
            },
            signature = {
                enabled = true,
                window = {
                    border = "single",
                },
            },
            appearance = {
                nerd_font_variant = "mono",
                kind_icons = {
                    Copilot = "",
                    Text = "󰉿",
                    Method = "󰊕",
                    Function = "󰊕",
                    Constructor = "󰒓",

                    Field = "󰜢",
                    Variable = "󰆦",
                    Property = "󰖷",

                    Class = "󱡠",
                    Interface = "󱡠",
                    Struct = "󱡠",
                    Module = "󰅩",

                    Unit = "󰪚",
                    Value = "󰦨",
                    Enum = "󰦨",
                    EnumMember = "󰦨",

                    Keyword = "󰻾",
                    Constant = "󰏿",

                    Snippet = "󱄽",
                    Color = "󰏘",
                    File = "󰈔",
                    Reference = "󰬲",
                    Folder = "󰉋",
                    Event = "󱐋",
                    Operator = "󰪚",
                    TypeParameter = "󰬛",
                },
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer", "copilot" },
                providers = {
                    copilot = {
                        name = "copilot",
                        module = "blink-cmp-copilot",
                        score_offset = 100,
                        async = true,
                        transform_items = function(_, items)
                            local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
                            local kind_idx = #CompletionItemKind + 1
                            CompletionItemKind[kind_idx] = "Copilot"
                            for _, item in ipairs(items) do
                                item.kind = kind_idx
                            end
                            return items
                        end,
                    },
                },
            },
            fuzzy = { implementation = "prefer_rust_with_warning" },
        },
        opts_extend = { "sources.default" },
    },
}
