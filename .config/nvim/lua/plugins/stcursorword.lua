return {
	"sontungexpt/stcursorword",
	event = "VeryLazy",
	config = function()
		require('stcursorword').setup({
		highlight = {
			underline = true,
			fg = "#666600",
			bg = "#330033",
		}})
	end
}
