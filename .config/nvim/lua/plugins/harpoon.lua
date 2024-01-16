return {
	'ThePrimeagen/harpoon',
	branch = 'harpoon2',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{ "<leader>a", function() require("harpoon"):list():append() end },
		{ "<C-e>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end },
		{ "<M-0>", function() require("harpoon"):list():select(1) end },
		{ "<M-9>", function() require("harpoon"):list():select(2) end },
		{ "<M-8>", function() require("harpoon"):list():select(3) end },
		{ "<M-7>", function() require("harpoon"):list():select(4) end },
	},
	opts = {
		settings = {
			sync_on_ui_close = true,
			sync_on_ui_toggle = true,
			key = function()
				return vim.loop.cwd()
			end,
		},
	}
}
