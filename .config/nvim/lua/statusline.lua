require('lualine').setup{
	options = {
		theme='palenight',
		section_separators = {'', ''},
		component_separators = {'', ''}
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = { {'branch', icon = ''} },
		lualine_c = { {'filename', file_status = true, full_path = true} },
		lualine_x = {'fileformat', 'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	}
}
