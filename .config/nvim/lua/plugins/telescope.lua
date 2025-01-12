return {
	'nvim-telescope/telescope.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		"nvim-telescope/telescope-frecency.nvim",
		{ 'nvim-telescope/telescope-fzf-native.nvim', build='make' },
	},

	lazy = false,
	config = function()
		local ts = require('telescope')
		local h_pct = 1
		local w_pct = 1
		local w_limit = 75
		local fullscreen_setup = {
			borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
			preview = { hide_on_startup = false },
			layout_strategy = 'flex',
			layout_config = {
				flex = { flip_columns = 100 },
				horizontal = {
					mirror = false,
					prompt_position = 'top',
					width = function(_, cols, _)
						return math.floor(cols * w_pct)
					end,
					height = function(_, _, rows)
						return math.floor(rows * h_pct)
					end,
					preview_cutoff = 10,
					preview_width = 0.5,
				},
				vertical = {
					mirror = true,
					prompt_position = 'top',
					width = function(_, cols, _)
						return math.floor(cols * w_pct)
					end,
					height = function(_, _, rows)
						return math.floor(rows * h_pct)
					end,
					preview_cutoff = 10,
					preview_height = 0.5,
				},
			},
		}

		ts.setup {
			defaults = vim.tbl_extend('error', fullscreen_setup, {
				sorting_strategy = 'ascending',
				mappings = {
					n = {
						['o'] = require('telescope.actions.layout').toggle_preview,
						['<Esc>'] = require('telescope.actions').close,
				        ["<C-a>"] = require('telescope.actions').results_scrolling_left,
						["<C-e>"] = require('telescope.actions').results_scrolling_right,
					},
					i = {
						['<C-o>'] = require('telescope.actions.layout').toggle_preview,
						['<Esc>'] = require('telescope.actions').close,
				        ["<C-a>"] = require('telescope.actions').results_scrolling_left,
						["<C-e>"] = require('telescope.actions').results_scrolling_right,
					},
				},
			}),
			ts.load_extension('fzf')
		}
	end,
}
