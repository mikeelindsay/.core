return {
	"nvim-treesitter/nvim-treesitter",
	lazy=false,
	dependencies = {
		"nvim-treesitter/playground",
	},
	build = function()
		vim.cmd([[TSUpdate]])
	end,
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"c",
				"c_sharp",
				"dockerfile",
				"git_config",
				"git_rebase",
				"go",
				"gomod",
				"gosum",
				"gowork",
				"javascript",
				"json",
				"json5",
				"jsonc",
				"lua",
				"python",
				"sql",
				"vimdoc",
				"yaml",
			},
			sync_install = false,
			auto_install = false,
			ignore_install = {},
			modules = {},
			highlight = {
				enable = true,
				disable = { "dockerfile" },
				additional_vim_regex_highlighting = false
			},
			indent = { enable = true },
		})
	end,
}
