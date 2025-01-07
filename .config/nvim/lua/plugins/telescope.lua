return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.5',
	dependencies = {
		"nvim-telescope/telescope-frecency.nvim",
		'nvim-lua/plenary.nvim',
		{ "debugloop/telescope-undo.nvim", lazy = false},
	},
		keys = {
			{ "<leader>u", "<cmd>Telescope undo<cr>", silent = true },
			{ "<leader>ff", ":Telescope git_files<CR>", silent = true },
			{ "<leader>fr", ":lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy({ bufnr = 0, layout_config = { height = 0.8 } }))<cr>", silent = true },
			{ "<leader>fh", ":Telescope help_tags<CR>", silent = true },
			{ "<leader>fg", ":Telescope live_grep<CR>", silent = true },
			{ "<leader>fb", ":Telescope buffers<CR>", silent = true },

			{ "<leader>fd", ":Telescope current_buffer_fuzzy_find<cr>", silent = true },
			{ "<leader><leader>", "<Cmd>Telescope frecency workspace=CWD<CR>", silent = true},
			{ "<leader>Fg",function()
				vim.ui.input({ prompt = "Glob: ", completion = "file", default = "**/*." }, function(glob_pattern)
					require('telescope.builtin').live_grep({
						vimgrep_arguments = {
							"rg",
							"--color=never",
							"--no-heading",
							"--with-filename",
							"--line-number",
							"--column",
							"--smart-case",
							"--glob=" .. (glob_pattern or ""),
						}
				 })
			end)
		end , {}}
		},
	opts = {
		extensions = {
			undo = {
			use_delta = true,
			use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
			side_by_side = false,
			diff_context_lines = vim.o.scrolloff,
			entry_format = "state #$ID, $STAT, $TIME",
			time_format = "",
			saved_only = false,
			},
		},
		pickers = {
			defaults = {
				vimgrep_arguments = {
				   'rg',
				   '--color=never',
				   '--no-heading',
				   '--with-filename',
				   '--line-number',
				   '--column',
				   '--smart-case',
				   '--ignore-file',
				   '.gitignore'
				},
			},
			find_files = {
				hidden = true
			},
			git_files = {
				show_untracked = true
			}
		},
		function()
				require("telescope").load_extension("frecency")
				require("telescope").load_extension("undo")
		end
	}
}
