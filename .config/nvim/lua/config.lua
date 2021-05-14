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
vim.g.moonlight_italic_comments = true
vim.g.moonlight_italic_keywords = true
vim.g.moonlight_italic_functions = true
vim.g.moonlight_italic_variables = false
vim.g.moonlight_contrast = true
vim.g.moonlight_borders = false 
vim.g.moonlight_disable_background = false

-- Bufferline setup
require('bufferline').setup {
    options = {
        offsets = {{filetype = "NvimTree", text = "Explorer"}},
        buffer_close_icon = "",
        modified_icon = "",
        close_icon = " ",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 20,
        show_tab_indicators = true,
        enforce_regular_tabs = false,
        view = "multiwindow",
        show_buffer_close_icons = true,
        separator_style = "thin",
        mappings = "true"
    },
    highlights = {
        fill = {
            guifg = bar_fg,
            guibg = "#252931"
        },
        background = {
            guifg = bar_fg,
            guibg = "#252931"
        },
    }
}
