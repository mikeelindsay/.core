vim.opt.colorcolumn = {"80", "130"}
vim.opt.scrolloff = 99999
vim.api.nvim_command [[ set nu rnu ]]
vim.api.nvim_command [[ set nowrap ]]
vim.opt.list = true
vim.opt.cursorline = true
vim.api.nvim_command [[ set signcolumn=yes ]]
vim.api.nvim_command [[ set nofixendofline ]]
vim.opt.clipboard = "unnamedplus"

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
