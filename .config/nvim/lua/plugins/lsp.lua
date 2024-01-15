return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/nvim-cmp',
		'petertriho/cmp-git',
		'zbirenbaum/copilot.lua',
		'zbirenbaum/copilot-cmp',
		'github/copilot.vim',
	},
	config = function()
		local mason = require("mason")

		mason.setup()

		 require("mason-lspconfig").setup {
			ensure_installed = {
				"lua_ls",
				"powershell_es"
			}
		}

		local lspconfig = require("lspconfig")
		local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

		lspconfig.lua_ls.setup(
		    {
			capabilities = lsp_capabilities,
			settings = {
			    Lua = {
				diagnostics = {
				    globals = {"vim"}
				}
			    }
			}
		    }
		)

		lspconfig.powershell_es.setup(
			{
				capabilities = lsp_capabilities
			}
		)
		local cmp = require "cmp"
		local has_words_before = function()
			if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
				return false
			end
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
		end
		cmp.setup(
		    {
			experimental = {ghost_text = false},
			snippet = {
				expand = function(args)
				vim.fn["vsnip#anonymous"](args.body)
			    end
			},
			window = {
			    completion = cmp.config.window.bordered(),
			    documentation = cmp.config.window.bordered()
			},
			mapping = cmp.mapping.preset.insert(
			    {
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({select = true})
			    }
			),
			sources = cmp.config.sources(
			    {
				{name = "nvim_lsp"},
				{name = "vsnip"}
			    },
			    {
				{name = "buffer"}
			    }
			)
		    }
		)
		cmp.setup.cmdline(
		    {
			    "/",
			    "?"
		    },
		    {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
			    {name = "buffer"}
			}
		    }
		)

		cmp.setup.cmdline(
			":",
			{
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources(
					{
						{name = "path"}
					},
					{
						{name = "cmdline"}
					}
				)
			}
		)
	end,
}
