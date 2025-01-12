-- Scrolls up and down the screen and recenters cursor in buffer
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--Search and replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Recenter when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Block comment
vim.keymap.set("v", "<leader><leader><leader>", "m6gc`6", { remap=true })
vim.keymap.set("n", "<leader><leader><leader>", "m6Vgc`6", { remap=true })

-- Convert space indentation to tabs and keep cursor where in it's current position
vim.api.nvim_set_keymap('n', '<F11>', 'm`gg=G``', { noremap = true, silent = true })

-- Shift block of text up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Map the function to the F10 key in normal, insert, and visual modes
vim.api.nvim_set_keymap('n', '<F10>', ':lua ToggleRelativeLineNumbers()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<F10>', '<C-o>:lua ToggleRelativeLineNumbers()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<F10>', '<Esc>:lua ToggleRelativeLineNumbers()<CR>', { noremap = true, silent = true })

-- Function to toggle relative line numbers
function ToggleRelativeLineNumbers()
	local current_value = vim.wo.relativenumber
	if current_value then
		vim.opt.relativenumber = false
		vim.opt.number = true
	else
		vim.opt.relativenumber = true
		vim.opt.number = true
	end
end

-- Automatically re-source current file
vim.keymap.set("n", "<leader>rl", function()
	vim.cmd("so")
end)

-- Language server jump to defination
vim.keymap.set("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>")

-- Telescope
vim.keymap.set('n', 'gr', function() require('telescope.builtin').lsp_references() end, { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', ':Telescope help_tags<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ff',':lua SearchByFileName()<CR>', { noremap = true, silent = true })

local is_inside_work_tree = {}
function SearchByFileName()
	local opts = {}

	local cwd = vim.fn.getcwd()
	if is_inside_work_tree[cwd] == nil then
		vim.fn.system("git rev-parse --is-inside-work-tree")
		is_inside_work_tree[cwd] = vim.v.shell_error == 0
	end

	if is_inside_work_tree[cwd] then
		require("telescope.builtin").git_files({ show_untracked = true })
	else
		require("telescope.builtin").find_files(opts)
	end
end

-- Copilot
vim.keymap.set('i', '<C-L>', '<Plug>(copilot-accept-word)')


vim.api.nvim_set_keymap("n", "<leader>a", ":lua require('tiny-code-action').code_action()<CR>", { noremap = true, silent = true })
