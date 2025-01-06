-- Define a function to highlight trailing whitespaces and sequences of more than one space between words
local function highlightExtraSpaces()
  -- Define the highlight group

  vim.cmd('highlight ExtraSpaces ctermbg=darkred guibg=darkred')
  vim.cmd('highlight NoSpaceBeforeBrace ctermbg=darkred guibg=darkred')

  local filetype = vim.bo.filetype
  if filetype ~= "lua" and filetype ~= "ps1" and fileType ~= "cs" then
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

  -- Add match for '{' without a space, tab, '(', and not directly inside single or double quotes before it
  vim.g.no_space_before_brace_id = vim.fn.matchadd('NoSpaceBeforeBrace', "[^ ('\"\t]\\zs{")
end

-- Set up an autocmd to highlight spaces when entering a buffer or text is changed
vim.api.nvim_create_autocmd({'BufEnter', 'TextChanged', 'InsertLeave'}, {
  pattern = '*',
  callback = highlightExtraSpaces,
})
USER = os.getenv("USER")
local curr_group = vim.fn.system("id -ng 2> /dev/null | tr -d '\n'")

SWAPDIR = "/home/" .. curr_group .. "/" .. USER .. "/nvim/swap//"
BACKUPDIR = "/home/" .. curr_group .. "/" .. USER .. "/nvim/backup//"
UNDODIR = "/home/" .. curr_group .. "/" .. USER .. "/nvim/undo//"

if vim.fn.isdirectory(SWAPDIR) == 0 then
	vim.fn.mkdir(SWAPDIR, "p", "0o700")
end

if vim.fn.isdirectory(BACKUPDIR) == 0 then
	vim.fn.mkdir(BACKUPDIR, "p", "0o700")
end

if vim.fn.isdirectory(UNDODIR) == 0 then
	vim.fn.mkdir(UNDODIR, "p", "0o700")
end
-- Enable swap, backup, and persistant undo
vim.opt.directory = SWAPDIR
vim.opt.backupdir = BACKUPDIR
vim.opt.undodir = UNDODIR
vim.opt.swapfile = false
vim.opt.backup = true
vim.opt.undofile = true

-- Append backup files with timestamp
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		local extension = "~" .. vim.fn.strftime("%Y-%m-%d-%H%M%S")
		vim.o.backupext = extension
	end,
})

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.colorcolumn = {"80", "130"}
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
	vim.fn.system( {
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
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--     pattern = {"*"},
--     callback = function()
--       local save_cursor = vim.fn.getpos(".")
--       pcall(function() vim.cmd [[%s/\s\+$//e]] end)
--       vim.fn.setpos(".", save_cursor)
--     end,
-- 	})
-- -- Define the highlight groups with faded colors and a light gray tint
-- vim.cmd [[
--   highlight DiagnosticError guifg=#8B8000 gui=bold
--   highlight DiagnosticWarn guifg=#FFD9B3 gui=bold
--   highlight DiagnosticInfo guifg=#CCE5FF gui=bold
--   highlight DiagnosticHint guifg=#CCFFCC gui=bold
--
--   highlight DiagnosticErrorLn guibg=#441111 guifg=#FFFFFF
--   highlight DiagnosticWarnLn guibg=none guifg=none
--   highlight DiagnosticInfoLn guibg=none guifg=none
--   highlight DiagnosticHintLn guibg=none guifg=none
--
-- ]]
-- vim.cmd([[highlight DiagnosticVirtualTextError guibg=none guifg=#8B8000]]) vim.cmd([[highlight DiagnosticVirtualTextWarn guibg=#none]]) vim.cmd([[highlight DiagnosticVirtualTextInfo guibg=#1a212e]]) vim.cmd([[highlight DiagnosticVirtualTextHint guibg=#1a212e]])
-- -- Configure diagnostics
-- vim.diagnostic.config {
--   signs = {
--     -- Define the text to be displayed for each diagnostic severity level
--     text = {
--       [vim.diagnostic.severity.ERROR] = "E",  -- Display "E" for errors
--       [vim.diagnostic.severity.WARN]  = "W",  -- Display "W" for warnings
--       [vim.diagnostic.severity.INFO]  = "I",  -- Display "I" for informational messages
--       [vim.diagnostic.severity.HINT]  = "H",  -- Display "H" for hints
--     },
--
--     -- Define the highlight groups for the line numbers for each severity level
--     numhl = {
--       [vim.diagnostic.severity.ERROR] = "DiagnosticErrorNr",  -- Highlight group for errors
--       [vim.diagnostic.severity.WARN]  = "DiagnosticWarnNr",   -- Highlight group for warnings
--       [vim.diagnostic.severity.INFO]  = "DiagnosticInfoNr",   -- Highlight group for informational messages
--       [vim.diagnostic.severity.HINT]  = "DiagnosticHintNr",   -- Highlight group for hints
--     },
--
--     -- Define the highlight groups for the entire line for each severity level
--     linehl = {
--       [vim.diagnostic.severity.ERROR] = "DiagnosticErrorLn",
--       [vim.diagnostic.severity.WARN]  = "DiagnosticWarnLn",
--       [vim.diagnostic.severity.INFO]  = "DiagnosticInfoLn",
--       [vim.diagnostic.severity.HINT]  = "DiagnosticHintLn",
--     },
--   },
-- 	update_in_insert = true,
-- 	severity_sort = true,
-- }
-- -- Define highlight groups for specific areas
-- vim.api.nvim_set_hl(0, 'DiagnosticsArea', { bg = '#D32F2F' }) -- Dark red for the specific area
--
-- -- Function to highlight lines and areas with diagnostics issues
-- local function highlight_diagnostics()
--     -- Clear previous highlights
--     vim.api.nvim_buf_clear_namespace(0, vim.g.diagnostics_ns, 0, -1)
--
--     -- Get diagnostics for the current buffer
--     local diagnostics = vim.diagnostic.get(0)
--     for _, diagnostic in ipairs(diagnostics) do
--         -- Highlight the specific area of the error (from col to end_col)
--         vim.api.nvim_buf_add_highlight(0, vim.g.diagnostics_ns, 'DiagnosticsArea', diagnostic.lnum, diagnostic.col, diagnostic.end_col)
--     end
-- end
--
-- -- Create a namespace for diagnostics highlights
-- vim.g.diagnostics_ns = vim.api.nvim_create_namespace('diagnostics_ns')
--
-- -- Set up autocommand to run the highlight function on BufEnter and DiagnosticChanged events
-- vim.api.nvim_create_autocmd({ 'BufEnter', 'DiagnosticChanged' }, {
--     callback = highlight_diagnostics,
-- })
--
-- -- Optionally, run the highlight function when the script is sourced
-- highlight_diagnostics()
--
--
-- -- Set the highlight color for unreachable and unused code to light gray
-- vim.api.nvim_set_hl(0, 'UnreachableCode', { fg = '#d3d3d3' })
-- vim.api.nvim_set_hl(0, 'UnusedCode', { fg = '#d3d3d3' })
--
-- -- Link the custom highlight groups to the corresponding diagnostics
-- vim.cmd [[
--   autocmd ColorScheme * highlight link DiagnosticUnreachableCode UnreachableCode
--   autocmd ColorScheme * highlight link DiagnosticUnusedCode UnusedCode
-- ]]
--
-- -- Assuming you are using the built-in LSP, configure the diagnostics
-- local function set_custom_diagnostics_highlight()
--   local ns = vim.api.nvim_create_namespace("my_custom_highlights")
--   vim.diagnostic.handlers.signs = {
--     show = function(_, bufnr, _, opts)
--       local diagnostics = vim.diagnostic.get(bufnr, opts)
--       for _, d in ipairs(diagnostics) do
--         if d.message:match("unreachable code") then
--           vim.api.nvim_buf_add_highlight(bufnr, ns, 'UnreachableCode', d.lnum, d.col, d.end_col)
--         elseif d.message:match("unused") then
--           vim.api.nvim_buf_add_highlight(bufnr, ns, 'UnusedCode', d.lnum, d.col, d.end_col)
--         end
--       end
--     end,
--   }
-- end
-- -- Call the function to set custom diagnostic highlights
-- set_custom_diagnostics_highlight()
vim.api.nvim_create_autocmd("LspAttach", { callback = function(args) local client = vim.lsp.get_client_by_id(args.data.client_id) client.server_capabilities.semanticTokensProvider = nil end, });

vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#dcdcaa" })
