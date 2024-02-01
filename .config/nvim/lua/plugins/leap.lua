return {
  "ggandor/leap.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require('leap').create_default_mappings()
    vim.api.nvim_set_hl(0, "LeapBackdrop", {link = "Comment"})
    vim.api.nvim_set_hl(
      0,
      "LeapMatch",
      {
        fg = "white", -- for light themes, set to 'black' or similar
        bold = true,
        nocombine = true
      }
    )
    require("leap").opts.highlight_unlabeled_phase_one_targets = true
        vim.api.nvim_set_hl(0, "LeapLabelPrimary", {fg = "yellow", bold = true, nocombine = true })
        vim.api.nvim_set_hl(0, "LeapLabelSecondary", {fg = "blue", bold = true, nocombine = true })
        require('leap').opts.safe_labels = {}

        vim.keymap.set('n', 's', function ()
                require('leap').leap { target_windows = { vim.api.nvim_get_current_win() } }
        end)
end,
}
