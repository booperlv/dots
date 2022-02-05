local M = {}

vim.g.mapleader = ' '

function M.map(allkeys)
	for index, value in pairs(allkeys) do
		if type(value) == "table" then
			-- mode, key, value, opts
			if #value >= 4 then
				vim.api.nvim_set_keymap(value[1], value[2], value[3], value[4])
			else
				vim.api.nvim_set_keymap(value[1], value[2], value[3], {noremap=true})
			end
		else
			print("mapping has invalid values at index "..index)
			return false
		end
	end
	return true
end

M.map({

	--Registers
	{'n', ' y', '"+y'},
	{'x', ' y', '"+y'},

	{'n', ' p', '"+p'},
	{'x', ' p', '"+p'},

	{'n', ' x', '"+x'},
	{'x', ' x', '"+x'},
	{'n', ' d', '"+d'},
	{'x', ' d', '"+d'},

	{'n', ' X', '"_x'},
	{'x', ' X', '"_x'},
	{'n', ' D', '"_d'},
	{'x', ' D', '"_d'},

	--Plugins
	{'n', ' ibt', ':IndentBlanklineToggle<CR>'},

	{'n', ' clt', ':ColorizerToggle<CR>'},

  --Emmet
	{'n', ' em', ':call feedkeys("<C-Y>,")<CR>', {nowait=true, noremap=true}},

  --Bufferline
  {'n', ' h', ':BufferLineCyclePrev<CR>', {nowait=true, noremap=true}},
  {'n', ' l', ':BufferLineCycleNext<CR>', {nowait=true, noremap=true}},
  {'n', ' H', ':BufferLineMovePrev<CR>', {nowait=true, noremap=true}},
  {'n', ' L', ':BufferLineMoveNext<CR>', {nowait=true, noremap=true}},

  {'n', ' bp', ':BufferLinePick<CR>', {nowait=true, noremap=true}},
  {'n', ' bq', ':BufferLinePickClose<CR>', {nowait=true, noremap=true}},
	{'n', ' bd', ':bdelete<CR>', {nowait=true, noremap=true}},
	{'n', ' q', ':bwipeout<CR>', {nowait=true, noremap=true}},

  --Compe
	{'i', '<C-Space>', 'compe#complete()', {silent = true, expr = true} },
	{'i', '<C-e>', 'compe#close("<C-e>")', {silent = true, expr = true} },

  --Nvim tree
	{'n', ' tt', ':NvimTreeToggle<CR>'},
	{'n', ' tr', ':NvimTreeRefresh<CR>'},

  --Handy Mappings
  {'', 'H', '^'},
  {'', 'L', '$'},
  {'', ' w', '<C-w>'},
})

return M
