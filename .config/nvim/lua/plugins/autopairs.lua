
require('nvim-autopairs').setup({
	disable_filetype = {"fzf","TelescopePrompt","vim","NvimTree" },
	ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
  fast_wrap = {},
	-- fast_wrap = {
	-- 	map = '<M-e>',
	-- 	chars = { '{', '[', '(', '"', "'" },
	-- 	pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
	-- 	offset = 0, -- Offset from pattern match
	-- 	end_key = '$',
	-- 	keys = 'qwertyuiopzxcvbnmasdfghjkl',
	-- 	check_comma = true,
	-- 	hightlight = 'Search',
	-- 	highlight_grey='Comment'
	-- },
})

-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
