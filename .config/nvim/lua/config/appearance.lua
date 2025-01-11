
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

-- Turn lowers the priority of the semantic tokens used to color in
vim.highlight.priorities.semantic_tokens = 95

-- Colorscheme
vim.o.background = "dark"
vim.opt.termguicolors = true

-- Define a function to set highlights
local function set_highlight(group, properties)
	vim.api.nvim_set_hl(0, group, properties)
end

-- Set custom highlights - From theme https://github.com/MohammedAldosari/simple-black-theme/blob/master/themes/dark_plus.json
set_highlight("Normal", { fg = "#f8f8ff", bg = "#000000" })
set_highlight("Comment", { fg = "#6A9955", bold=false, italic = true, force = true, blend=100 })
set_highlight("Whitespace", {fg = "#242524"})
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

set_highlight('RainbowDelimiterBlue', {fg = "#569cd6"})
set_highlight('RainbowDelimiterYellow', {fg = "#dddd55"})
set_highlight('RainbowDelimiterViolet', {fg = "#cc55ff"})

set_highlight("@module.builtin.lua", { fg = "#9cdcfe" })
set_highlight("@function.builtin.lua", { fg = "#dcdcaa" })
set_highlight("@string.escape.lua", { fg = "#d7ba7d", bold=true})
set_highlight("@variable.builtin.vim", {fg = "#9cdcfe"})

set_highlight("@module.c_sharp", {fg = "#4EC9B0"})
set_highlight("@type.c_sharp", {fg = "#4EC9B0"})
set_highlight("@type.builtin.c_sharp", {fg = "#4EC9B0"})
set_highlight("@lsp.type.enumMember", {fg = "#9cdcfe"})
set_highlight("@variable.builtin.c_sharp", {fg = "#569cd6"})
set_highlight("@constructor.c_sharp", {fg = "#dcdcaa"})
set_highlight("@keyword.conditional.c_sharp", {fg = "#C586C0"})
set_highlight('@punctuation.special.c_sharp', {fg = "#569cd6"})

set_highlight("TelescopeMatching", { fg = "#d7ba7d", bold=true})
set_highlight("TelescopeResultsNormal", { fg = "#242524" })
set_highlight("TelescopeBorder", { fg = "#242524" })

set_highlight("CmpNormal", {background = "#242524", foreground = "#D4D4D4"})
set_highlight("CmpItemAbbrMatch", {fg="#569CD6"})
set_highlight("CmpItemAbbrMatchFuzzy", {fg="#569CD6"})
set_highlight("CmpItemKindFunction", {fg="#C586C0"})
set_highlight("CmpItemKindMethod", {fg="#C586C0"})
set_highlight("CmpItemKindVariable", {fg="#9CDCFE"})
set_highlight("CmpItemKindKeyword", {fg="#D4D4D4"})


-- gray
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg='NONE', strikethrough=true, fg='#808080' })
-- blue
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg='NONE', fg='#569CD6' })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link='CmpIntemAbbrMatch' })
-- light blue
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg='NONE', fg='#9CDCFE' })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link='CmpItemKindVariable' })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { link='CmpItemKindVariable' })
-- pink
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg='NONE', fg='#C586C0' })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link='CmpItemKindFunction' })
-- front
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg='NONE', fg='#D4D4D4' })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link='CmpItemKindKeyword' })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link='CmpItemKindKeyword' })


set_highlight("DiagnosticUnnecessary", { fg = "#242524" })
