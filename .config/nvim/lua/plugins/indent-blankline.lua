return {
	'lukas-reineke/indent-blankline.nvim',
	lazy = false,
	config = function()
		local highlight = {
			"RainbowRed",
		}

		local hooks = require "ibl.hooks"
		-- create the highlight groups in the highlight setup hook, so they are reset
		-- every time the colorscheme changes
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0,"IblScope", {fg = "#242524"})
			vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#242524" })
		end)

		require("ibl").setup({
			indent = {
				char = "│",
				tab_char = "▏",
				highlight = highlight
			},
			scope = {
				show_start = false,
				show_end = false,
			}
		})
	end
}
