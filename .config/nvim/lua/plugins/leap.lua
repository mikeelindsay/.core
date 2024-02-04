return {
	{
		"ggandor/flit.nvim",
		lazy = false,
		keys = function()
			local ret = {}
			for _, key in ipairs {"f", "F", "t", "T"} do
				ret[#ret + 1] = {key, mode = {"n", "x", "o"}, desc = key}
			end
			return ret
		end,
		opts = {labeled_modes = "nx"},
		dependencies = {
			"ggandor/leap.nvim",
			dependencies = {
				"tpope/vim-repeat"
			},
			config = function()
				require("leap").create_default_mappings()
				require("leap").opts.highlight_unlabeled_phase_one_targets = true
				vim.api.nvim_set_hl(0, "LeapBackdrop", {fg = "gray"})
				vim.api.nvim_set_hl(0, "LeapMatch", { fg = "white", bold = true, nocombine = true })
				vim.api.nvim_set_hl(0, "LeapLabelPrimary", {fg = "yellow", bold = true, nocombine = true})
				vim.api.nvim_set_hl(0, "LeapLabelSecondary", {fg = "gray", bold = true, nocombine = true})
				vim.keymap.set( "n", "s",
					function()
						require("leap").leap {target_windows = {vim.api.nvim_get_current_win()}}
					end
				)
			end
		}
	}
}
