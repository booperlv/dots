--Require Language Server Configuration File
require('lsp_config')

--Hex,RGB,... Code Colorizer
require'colorizer'.setup()

--Autoparis and stuff
require("nvim-autopairs").setup()

--Telescope, Fuzzy Finder, File Explorer
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    mappings = {
      i = {},
      n = {
	[","] = actions.move_selection_next,
	["."] = actions.move_selection_previous,
        ["<esc>"] = actions.close,
        ["<C-i>"] = my_cool_custom_action,
      },
    },
    inactive_sections = {" "},
  }
}

--Material/Moonlight colorscheme config
vim.g.moonlight_italic_comments = true
vim.g.moonlight_italic_keywords = true
vim.g.moonlight_italic_functions = true
vim.g.moonlight_italic_variables = false
vim.g.moonlight_contrast = true
vim.g.moonlight_borders = false 
vim.g.moonlight_disable_background = false

--Nvim Tree Bindings
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
    vim.g.nvim_tree_bindings = {
      ["<CR>"] = ":YourVimFunction()<cr>",
      ["u"] = ":lua require'some_module'.some_function()<cr>",

      -- default mappings
      ["<CR>"]           = tree_cb("edit"),
      ["o"]              = tree_cb("edit"),
      ["<2-LeftMouse>"]  = tree_cb("edit"),
      ["<2-RightMouse>"] = tree_cb("cd"),
      ["<"]          = tree_cb("cd"),
      ["V"]          = tree_cb("vsplit"),
      ["H"]          = tree_cb("split"),
      ["T"]          = tree_cb("tabnew"),
      ["<BS>"]           = tree_cb("close_node"),
      ["<S-CR>"]         = tree_cb("close_node"),
      ["<Tab>"]          = tree_cb("preview"),
      ["R"]              = tree_cb("refresh"),
      ["c"]              = tree_cb("create"),
      ["r"]              = tree_cb("remove"),
      ["n"]              = tree_cb("rename"),
      ["N"]          = tree_cb("full_rename"),
      [">"]              = tree_cb("dir_up"),
      ["q"]              = tree_cb("close"),
    }

--Require Nvim-Compe Configuration File
require('compe-completion')

--Require Status Line Configuration File
dofile("/home/booperlv/.config/nvim/lua/statusline.lua")

--Require Buffer Line Configuration File
dofile("/home/booperlv/.config/nvim/lua/top-bufferline.lua")

