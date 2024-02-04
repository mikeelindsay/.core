-- Define a function to highlight trailing whitespaces and sequences of more than one space between words
local function highlightExtraSpaces()
  -- Define the highlight group

  vim.cmd('highlight ExtraSpaces ctermbg=red guibg=red')
  vim.cmd('highlight NoSpaceBeforeBrace ctermbg=yellow guibg=yellow')

  local filetype = vim.bo.filetype
  if filetype ~= "lua" and filetype ~= "ps1" then
    return
  end
-- Safely delete existing matches if they are valid
  local function safeMatchDelete(matchId)
    if matchId and matchId > 0 then
      pcall(vim.fn.matchdelete, matchId)
    end
  end

  -- Use pcall to safely attempt to delete matches and catch any errors silently
  safeMatchDelete(vim.g.extra_spaces_match_id_trailing)
  safeMatchDelete(vim.g.extra_spaces_match_id_indent)
  safeMatchDelete(vim.g.no_space_before_brace_id)

  -- Add match for trailing whitespaces
  vim.g.extra_spaces_match_id_trailing = vim.fn.matchadd('ExtraSpaces', '\\s\\+$')
  -- Add match for sequences of more than one space between words
  -- The pattern now specifically looks for two or more spaces following a non-whitespace character but only if it is not at the start of the line
  vim.g.extra_spaces_match_id_indent = vim.fn.matchadd('ExtraSpaces', '\\S\\zs\\s\\{2,}\\ze\\S')

 -- Add match for '{' without a space before it
  vim.g.no_space_before_brace_id = vim.fn.matchadd('NoSpaceBeforeBrace', '\\S\\zs{')
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
vim.opt.listchars = 'tab:» ,extends:›,precedes:‹,nbsp:·,trail:·,lead:·'
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
vim.api.nvim_set_hl(0, "Comment", { fg = "#007f00"})
vim.api.nvim_set_hl(0, "@comment", { link = "Comment"})

