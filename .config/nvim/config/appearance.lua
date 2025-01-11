-- Temporary work around due to issue with 10.3 to allow :Inspect to work on highlight groups
vim.hl = vim.highlight

-- Prevent cursor from disappearing in insert mode
vim.opt.guicursor = ""

-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

vim.api.nvim_command [[ set nowrap ]]
vim.api.nvim_command [[ set signcolumn=yes ]]

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#101010" })
vim.opt.colorcolumn = {"80", "130"}

vim.opt.cursorline = true

vim.opt.list = true
vim.opt.listchars = 'tab:→ ,trail:•,extends:>,precedes:<,space:·'

-- Colorscheme
vim.o.background = "dark"
vim.opt.termguicolors = true

-- Define a function to set highlights
local function set_highlight(group, properties)
    vim.api.nvim_set_hl(0, group, properties)
end

-- Set custom highlights
set_highlight("Normal", { fg = "#f8f8ff", bg = "#000000" })
set_highlight("Comment", { fg = "#6A9955", bold=false, italic = true, force = true, blend=100 })
set_highlight("String", { fg = "#ce9178"})
set_highlight("Number", { fg = "#b5cea8" })
set_highlight("Function", { fg = "#dcdcaa" })
set_highlight("Boolean", { fg = "#569cd6" })
set_highlight("Keyword", { fg = "#569cd6" })
set_highlight("Type", { fg = "#9cdcfe" })
set_highlight("StatusLine", { fg = "#abb2bf", bg = "#101010" })
set_highlight("Visual", { bg = "#242524", fg="#b0bb00", blend=50, bold=true })
set_highlight("@variable", {fg = "#9cdcfe"})

set_highlight("CursorLine", { bg = "#2c323c" })
set_highlight("CursorLineNr", { fg = "#dcdcaa" })

set_highlight('RainbowDelimiterBlue', {fg = "#5599ff"})
set_highlight('RainbowDelimiterYellow', {fg = "#dddd55"})
set_highlight('RainbowDelimiterViolet', {fg = "#cc55ff"})

set_highlight("@module.builtin.lua", { fg = "#9cdcfe" })
set_highlight("@function.builtin.lua", { fg = "#dcdcaa" })
set_highlight("@string.escape.lua", { fg = "#d7ba7d", bold=true})
set_highlight("@variable.builtin.vim", {fg = "#9cdcfe"})

set_highlight("TelescopeMatching", { fg = "#d7ba7d", bold=true})
set_highlight("TelescopeResultsNormal", { fg = "#242524" })
set_highlight("TelescopeBorder", { fg = "#242524" })

set_highlight("DiagnosticUnnecessary", { fg = "#242524" })
