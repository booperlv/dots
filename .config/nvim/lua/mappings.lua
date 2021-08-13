vim.g.mapleader = ' '

local function map(allkeys)
	for index, value in pairs(allkeys) do
		if type(value) == "table" then
			-- mode, key, value, opts
			if #value >= 4 then
				vim.api.nvim_set_keymap(value[1], value[2], value[3], value[4])
			else
				vim.api.nvim_set_keymap(value[1], value[2], value[3], {})
			end
		else
			print("mapping has invalid values at index "..index)
			return false
		end
	end
	return true
end

map({

	--Arrow keys
	{'n', 'm', 'h', {noremap = true}},
	{'n', ',', 'j', {noremap = true}},
	{'n', '.', 'k', {noremap = true}},
	{'n', '/', 'l', {noremap = true}},

	{'x', 'm', 'h', {noremap = true}},
	{'x', ',', 'j', {noremap = true}},
	{'x', '.', 'k', {noremap = true}},
	{'x', '/', 'l', {noremap = true}},

	{'n', '<C-m>', 'm', {noremap = true}},
	{'n', '<C-,>', ',', {noremap = true}},
	{'n', '<C-.>', '.', {noremap = true}},
	{'n', '<C-_>', '/', {noremap = true}},

	{'x', '<C-m>', 'm', {noremap = true}},
	{'x', '<C-,>', ',', {noremap = true}},
	{'x', '<C-.>', '.', {noremap = true}},
	{'x', '<C-_>', '/', {noremap = true}},


	--Extras
	{'n', ' y', '"+y'},
	{'x', ' y', '"+y'},

	{'n', ' P', '"+P'},
	{'x', ' P', '"+P'},
	{'n', ' p', '"+p'},
	{'x', ' p', '"+p'},

	{'n', ' d', '"_d'},
	{'x', ' d', '"_d'},

	--Windows
	{'n', ' wm', ':wincmd h<CR>'},
	{'n', ' w,', ':wincmd j<CR>'},
	{'n', ' w.', ':wincmd k<CR>'},
	{'n', ' w/', ':wincmd l<CR>'},

	{'n', ' wM', ':wincmd H<CR>'},
	{'n', ' w<', ':wincmd J<CR>'},
	{'n', ' w>', ':wincmd K<CR>'},
	{'n', ' w?', ':wincmd L<CR>'},

	{'n', ' w', '<C-w>'},

	--Plugins
	{'n', ' ibt', ':IndentBlanklineToggle<CR>'},

	{'n', ' ct', ':ColoToggle<CR>'},

	{'n', ' em', ':call feedkeys("<C-Y>,")<CR>'},

	{'n', ' /', ':BufferLineCycleNext<CR>'},
	{'n', ' m', ':BufferLineCyclePrev<CR>'},
	{'n', ' ?', ':BufferLineMoveNext<CR>'},
	{'n', ' M', ':BufferLineMovePrev<CR>'},
	{'n', ' q', ':bwipeout<CR>'},

	{'i', '<C-Space>', 'compe#complete()', {silent = true, expr = true} },
	{'i', '<CR>', 'compe#confirm("<CR>")', {silent = true, expr = true} },
	{'i', '<C-e>', 'compe#close("<C-e>")', {silent = true, expr = true} },

	{'n', ' xx', ':TroubleToggle<CR>'},
	{'n', ' xw', ':TroubleToggle lsp_workspace_diagnostics<CR>'},
	{'n', ' xd', ':TroubleToggle lsp_document_diagnostics<CR>'},
	{'n', ' xq', ':TroubleToggle quickfix<CR>'},
	{'n', ' xl', ':TroubleToggle loclist<CR>'},
	
	{'n', ' tt', ':NvimTreeToggle<CR>'},
	{'n', ' tr', ':NvimTreeRefresh<CR>'},

})
