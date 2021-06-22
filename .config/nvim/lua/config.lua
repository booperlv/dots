--Require custom functions
require('custom-functions')
--Require Language Server Configuration File
require('lsp_config')
--Require Treesitter Configuration File
require('treesitter')

--Autopairs and stuff
require("nvim-autopairs").setup()

--Color Selector
vim.g.cyclecolo_attach_events = { 'dofile("/home/booperlv/.config/nvim/lua/statusline.lua")', 'dofile("/home/booperlv/.config/nvim/lua/top-bufferline.lua")',}
require("cyclecolo").setup()

--Nvim Tree Bindings
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
    ["<S-CR>"]         = tree_cb("cd"),
    ["V"]              = tree_cb("vsplit"),
    ["H"]              = tree_cb("split"),
    ["T"]              = tree_cb("tabnew"),
    ["<BS>"]           = tree_cb("close_node"),
    ["<C-r>"]          = tree_cb("refresh"),
    ["r"]              = tree_cb("rename"),
    ["R"]              = tree_cb("full_rename"),
    ["q"]              = tree_cb("close"),
}

--Trouble/LSP error indicator
require("trouble").setup {}

--Zen Mode
require("zen-mode").setup {}

--LSP Signatures
require'lsp_signature'.on_attach()

--Require Nvim-Compe Configuration File
require('compe-completion')

--Require Status Line Configuration File
dofile("/home/booperlv/.config/nvim/lua/statusline.lua")

--Require Buffer Line Configuration File
dofile("/home/booperlv/.config/nvim/lua/top-bufferline.lua")
