return {
	'HiPhish/rainbow-delimiters.nvim',
	dependencies = 'nvim-treesitter',
	config = function()
		-- This module contains a number of default definitions
		local rainbow_delimiters = require 'rainbow-delimiters'

		require'rainbow-delimiters.setup'.setup {
			strategy = {
				[''] = rainbow_delimiters.strategy['global'],
				vim = rainbow_delimiters.strategy['local'],
			},
			priority = {
				[''] = 110,
				lua = 210,
			},
			highlight = {
				'RainbowDelimiterYellow',
				'RainbowDelimiterBlue',
				'RainbowDelimiterViolet',
			},
		}
	end
}
