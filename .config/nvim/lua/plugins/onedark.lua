return {
 -- "EdenEast/nightfox.nvim",
	'navarasu/onedark.nvim',
	config = function()
		local onedark = require('onedark')
		onedark.setup( { style = 'darker',
			highlights = {
				["Comment"] = { fg = "#007f00" },
				["@comment"] = { fg = "#007f00" },
				["@lsp.type.comment"] = { fg = "#007f00" },
				Normal = { bg = "#000000", fg = "#000000" },
				EndOfBuffer = { bg = "#000000" },
				 ["@keyword"] = { fg = "#569cd6" },

				 ["@keyword.function"] = { fg = "#569cd6" },
				["@lsp.keyword"] = { fg = "#569cd6"},
				Keyword = { fg = "#569cd6" },
				Type = { fg = '#4ec9b0' },
				["@type"] = { fg = '#4ec9b0' },
				["@lsp.type.type"] = { fg = "#4ec9b0"},
				String = { fg = "#ce9178" },
				["@string"] = { fg = "#ce9178" },
				["@lsp.string"] = { fg = "#ce9178" },
				["Function"] = { fg = "#dcdcaa" },
				["@function"] = { fg = "#dcdcaa" },
				["@lsp.function"] = { fg = "#dcdcaa" },
				["@function.method"] = { fg = "#dcdcaa" },
				["@function.call"] = { fg = "#dcdcaa" },
				["@function.builtin"] = { fg = "#dcdcaa" },
				["@lsp.type.function"] = { fg = "#dcdcaa"},
				["@lsp.type.functions"] = {fg = "#dcdcaa"},
				["@variable.parameter"] = {fg = "#9cdcfe"},
				["@variable"] = { fg = "#9cdcfe" },
				["@lsp.variable"] = { fg = "#9cdcfe" },
				["Identifier"] = { fg = "#9cdcfe" },
				["@variable.builtin"] = {fg = "#6b98b3" },
				["@variable.member"] = {fg = "#9cdcfe" },
				 ["@constant"] = { fg = "#569cd6" },
				 ["@type.builtin"] = { fg = "#569cd6" },
				["@keyword.conditional"] = {fg = "#c586c0" },
				["@keyword.operator"] = {fg = "#d4d4d4"},

			},
    code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },
		})
		onedark.load()
	end,
	lazy=false,
	priority = 100
}
