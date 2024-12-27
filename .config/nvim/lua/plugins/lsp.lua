
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
		'Hoffs/omnisharp-extended-lsp.nvim',
	},
	config = function()
		local mason = require("mason")

		mason.setup()

		 require("mason-lspconfig").setup {
			ensure_installed = {
				"lua_ls",
				"powershell_es",
				"omnisharp"
			}
		}
local rounded_border_handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}
	vim.keymap.set("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)

		local lspconfig = require("lspconfig")
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

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
lspconfig.omnisharp.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			root_dir = function(fname)
				local primary = lspconfig.util.root_pattern("*.sln")(fname)
				local fallback = lspconfig.util.root_pattern("*.csproj")(fname)
				return primary or fallback
			end,
			-- enable_ms_build_load_projects_on_demand = true,
			-- enable_roslyn_analyzers = true,
			-- analyze_open_documents_only = true,
			organize_imports_on_format = true,
			handlers = vim.tbl_extend("force", rounded_border_handlers, {
				["textDocument/definition"] = require("omnisharp_extended").handler,
			}),
		})
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
