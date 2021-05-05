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
      i = {
        ["<esc>"] = actions.close,
	},
      n = {
        ["<esc>"] = actions.close,
        ["<C-i>"] = my_cool_custom_action,
      },
    },
  }
}
