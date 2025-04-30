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
                    "cancel",
                    "fallback",
                },
                ["<Tab>"] = { "snippet_forward", "fallback" },
                ["<CR>"] = { "accept", "fallback" },
                ["<C-e>"] = { "cancel", "fallback" },
                ["<Up>"] = { "select_prev", "fallback" },
                ["<Down>"] = { "select_next", "fallback" },
                ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
                ["<C-n>"] = {
                    "show",
                    "select_next",
                    "fallback_to_mappings",
                },
                ["<C-b>"] = { "scroll_documentation_up", "fallback" },
                ["<C-f>"] = { "scroll_documentation_down", "fallback" },
                ["<S-Tab>"] = { "snippet_backward", "fallback" },
                ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
                ["<C-y>"] = { "accept", "fallback" },
            },
            cmdline = {
                keymap = {
                    ["<Tab>"] = {
                        "show",
                        "select_next",
                        "fallback_to_mappings",
                    },
                    ["<CR>"] = { "accept", "fallback" },
                    ["<C-e>"] = { "cancel", "fallback" },
                    ["<C-n>"] = {
                        "show",
                        "select_next",
                        "fallback_to_mappings",
                    },
                    ["<C-p>"] = {
                        "select_prev",
                        "fallback_to_mappings",
                    },
                    ["<C-y>"] = { "accept", "fallback" },
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
                menu = {
                    draw = {
                        columns = {
                            { "label", "label_description", gap = 1 },
                            { "kind_icon", gap = 1, "kind" },
                        },
                    },
                },
                list = {
                    selection = { preselect = false },
                },
                documentation = { auto_show = true, auto_show_delay_ms = 200 },
            },
            signature = {
                enabled = true,
                window = {
                    show_documentation = true,
                    border = "single",
                },
            },
            appearance = {
                nerd_font_variant = "mono",
                kind_icons = {
                    Copilot = "",
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
