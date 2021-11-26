-- nvim-treesitter
require("nvim-treesitter.configs").setup({
	ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	ignore_install = {}, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "elixir" }, -- list of language that will be disabled
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = 10000,
	},
})
