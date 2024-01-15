return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.5',
	dependencies = {
		"nvim-telescope/telescope-frecency.nvim",
		'nvim-lua/plenary.nvim',
	},
        keys = {
          { "<leader>ff", ":Telescope git_files<CR>", silent = true },
          { "<leader>fr", ":Telescope find_files<CR>", silent = true },
          { "<leader>fh", ":Telescope help_tags<CR>", silent = true },
          { "<leader>fg", ":Telescope live_grep<CR>", silent = true },
          { "<leader>fb", ":Telescope buffers<CR>", silent = true },
          { "<leader>fd", ":Telescope current_buffer_fuzzy_find<cr>", silent = true },
	  { "<leader><leader>", "<Cmd>Telescope frecency workspace=CWD<CR>", silent = true},
	  { "<localleader>F",function()
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
		end) end , {}}
        },
	opts = {
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
    			require("telescope").load_extension "frecency"
  		end
	}
}


