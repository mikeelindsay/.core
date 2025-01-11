-- Clear the neovim startup screen
vim.opt.shortmess:append('I')

-- Enable persistant undo, disable swap and backup
if vim.fn.isdirectory(UNDODIR) == 0 then
	vim.fn.mkdir(UNDODIR, "p", "0o700")
end

vim.opt.undodir = UNDODIR
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- Tell neovim not to adjust line endings
vim.api.nvim_command [[ set nofixendofline ]]

-- Searching
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Scroll offset
vim.opt.scrolloff = 8

-- Prevent unnamed plus from causing a long load time in neovim
vim.g.clipboard = {
  name = 'win32yank',
  copy = {
     ["+"] = 'win32yank.exe -i --crlf',
     ["*"] = 'win32yank.exe -i --crlf',
   },
  paste = {
     ["+"] = 'win32yank.exe -o --lf',
     ["*"] = 'win32yank.exe -o --lf',
  },
  cache_enabled = 0,
}

vim.opt.clipboard = "unnamedplus"
