	-- Define a function to highlight trailing whitespaces and sequences of more than one space between words
local function highlightExtraSpaces()
  -- Define the highlight group
  vim.cmd('highlight ExtraSpaces ctermbg=red guibg=red')

  -- Check if the match IDs exist and are valid before trying to delete them
  if vim.g.extra_spaces_match_id_trailing and vim.g.extra_spaces_match_id_trailing > 0 then
    vim.fn.matchdelete(vim.g.extra_spaces_match_id_trailing)
  end
  if vim.g.extra_spaces_match_id_indent and vim.g.extra_spaces_match_id_indent > 0 then
    vim.fn.matchdelete(vim.g.extra_spaces_match_id_indent)
  end

  -- Add match for trailing whitespaces
  vim.g.extra_spaces_match_id_trailing = vim.fn.matchadd('ExtraSpaces', '\\s\\+$')

  -- Add match for sequences of more than one space between words
  -- The pattern now specifically looks for two or more spaces following a non-whitespace character but only if it is not at the start of the line
  vim.g.extra_spaces_match_id_indent = vim.fn.matchadd('ExtraSpaces', '\\S\\zs\\s\\{2,}\\ze\\S')
end

-- Set up an autocmd to highlight spaces when entering a buffer or text is changed
vim.api.nvim_create_autocmd({'BufEnter', 'TextChanged', 'InsertLeave'}, {
  pattern = '*',
  callback = highlightExtraSpaces,
})
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.colorcolumn = {"80", "130"}
--vim.opt.scrolloff = 99999
vim.opt.scrolloff = 5
vim.api.nvim_command [[ set nu rnu ]]
vim.api.nvim_command [[ set nowrap ]]
vim.opt.list = true
vim.opt.cursorline = true
vim.api.nvim_command [[ set signcolumn=yes ]]
vim.api.nvim_command [[ set nofixendofline ]]
vim.opt.clipboard = "unnamedplus"
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.opt.listchars = 'tab:»»,extends:›,precedes:‹,nbsp:·,trail:·'
vim.opt.list = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  defaults = {
    lazy = false,
  },
  ui = {
    border = "single",
  }
})

