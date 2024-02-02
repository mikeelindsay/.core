return {
 "folke/trouble.nvim",
 opts = {

 },
 config = function()
    vim.keymap.set("n", "<leader>tt", function()
	require("trouble").toggle()
    end)
 end,
}
