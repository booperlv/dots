--Require Language Server Configuration File
require('lsp_config')
--Require Treesitter Configuration File
require('treesitter')

--Autopairs and stuff
require("nvim-autopairs").setup()

vim.g.cyclecolo_attach_events = { 'dofile("/home/booperlv/.config/nvim/lua/statusline.lua")', 'dofile("/home/booperlv/.config/nvim/lua/top-bufferline.lua")',}
require("cyclecolo").setup()

--Telescope, Fuzzy Finder, File Explorer
--local actions = require('telescope.actions')
--require('telescope').setup{
--  defaults = {
--    mappings = {
--      i = {},
--      n = {
--	[","] = actions.move_selection_next,
--	["."] = actions.move_selection_previous,
--        ["<esc>"] = actions.close,
--      },
--    },
--    inactive_sections = {" "},
--    borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
--  }
--}

--Nvim Tree Bindings
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
    vim.g.nvim_tree_bindings = {
      -- default mappings
      ["<CR>"]           = tree_cb("edit"),
      ["o"]              = tree_cb("edit"),
      ["<S-CR>"]         = tree_cb("cd"),
      ["V"]              = tree_cb("vsplit"),
      ["H"]              = tree_cb("split"),
      ["T"]              = tree_cb("tabnew"),
      ["<BS>"]           = tree_cb("close_node"),
      ["<Tab>"]          = tree_cb("preview"),
      ["<C-r>"]          = tree_cb("refresh"),
      ["c"]              = tree_cb("create"),
      ["r"]              = tree_cb("rename"),
      ["R"]              = tree_cb("remove"),
      ["N"]              = tree_cb("full_rename"),
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
