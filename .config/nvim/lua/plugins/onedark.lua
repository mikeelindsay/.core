return {
	'navarasu/onedark.nvim',
	config = function()
		local onedark = require('onedark')
		onedark.setup( { style = 'darker',
			highlights = {
				["Comment"] = { fg = "#007f00" },
				["@comment"] = { fg = "#007f00" },
				["@lsp.type.comment"] = { fg = "#007f00" },
			}
		})
		onedark.load()
	end,
	lazy=false,
	priority = 100
}
