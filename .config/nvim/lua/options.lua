local opt = vim.opt
local g = vim.g

opt.shell = '/bin/bash'
opt.lazyredraw = true

--Colorschemes
opt.termguicolors = true

g.ayu_mirage = true
g.material_borders = true

vim.cmd("colorscheme github_dark")

--Options
opt.foldmethod = "marker"
opt.hidden = true
opt.showmode = false
opt.mouse = 'a'
opt.number = true
opt.wrap = false
opt.fillchars = {eob = " "}
opt.ignorecase = true
opt.smartcase = true
opt.gdefault = true
opt.autoread = true

opt.shiftwidth = 2
opt.tabstop = 2
opt.autoindent = true
opt.smartindent = true
opt.expandtab = true

opt.colorcolumn = '81'
opt.textwidth = 80

opt.completeopt={'menuone','noselect'}

--Plugin globals
g.indent_blankline_char = "▏"
g.indent_blankline_show_first_indent_level = false
g.indent_blankline_show_trailing_blankline_indent = false

g.better_escape_shortcut = { 'jj', 'nn' }
g.better_escape_interval = 250
