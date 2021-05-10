--Require Language Server Configuration File
require('lsp_config')

--Require Status Line Configuration File
require('statusline')

--Hex,RGB,... Code Colorizer
require'colorizer'.setup()

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
  }
}

--Material/Moonlight colorscheme config
vim.g.material_style = 'moonlight'         
vim.g.material_italic_comments = true
vim.g.material_italic_keywords = true
vim.g.material_italic_functions = true
vim.g.material_italic_variables = false
vim.g.material_contrast = true
vim.g.material_borders = false 
vim.g.material_disable_background = false
