local M = {}

vim.g.mapleader = ' '

function M.map(allkeys)
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

M.map({

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


	--Registers
	{'n', ' y', '"+y'},
	{'x', ' y', '"+y'},

	{'n', ' P', '"+P'},
	{'x', ' P', '"+P'},
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

	{'n', ' clt', ':ColorizerToggle<CR>'},

  --Emmet
	{'n', ' em', ':call feedkeys("<C-Y>,")<CR>'},

  {'n', ' m', ':BufferLineCyclePrev<CR>'},
  {'n', ' /', ':BufferLineCycleNext<CR>'},
  {'n', ' M', ':BufferLineMovePrev<CR>'},
  {'n', ' ?', ':BufferLineMoveNext<CR>'},
  -- {'n', ' h', ':BufferLineCyclePrev<CR>'},
  -- {'n', ' l', ':BufferLineCycleNext<CR>'},
  -- {'n', ' H', ':BufferLineMovePrev<CR>'},
  -- {'n', ' L', ':BufferLineMoveNext<CR>'},

  {'n', ' bp', ':BufferLinePick<CR>'},
  {'n', ' bq', ':BufferLinePickClose<CR>'},
	{'n', ' bd', ':bdelete<CR>'},
	{'n', ' q', ':bwipeout<CR>'},

	{'i', '<C-Space>', 'compe#complete()', {silent = true, expr = true} },
	{'i', '<C-e>', 'compe#close("<C-e>")', {silent = true, expr = true} },

	{'n', ' tt', ':NvimTreeToggle<CR>'},
	{'n', ' tr', ':NvimTreeRefresh<CR>'},

  --This is kind of a temp thing

  {'n', '<A-m>', '<Plug>NormalMoveBlockLeft'},
  {'n', '<A-,>', '<Plug>NormalMoveLineDown'},
  {'n', '<A-.>', '<Plug>NormalMoveLineUp'},
  {'n', '<A-/>', '<Plug>NormalMoveBlockRight'},

  {'x', '<A-m>', '<Plug>VisualMoveBlockLeft'},
  {'x', '<A-,>', '<Plug>VisualMoveLineDown'},
  {'x', '<A-.>', '<Plug>VisualMoveLineUp'},
  {'x', '<A-/>', '<Plug>VisualMoveBlockRight'},

  {'n', '<A-M>', '<Plug>NormalDuplicateBlockLeft'},
  {'n', '<A-<>', '<Plug>NormalDuplicateLineDown'},
  {'n', '<A->>', '<Plug>NormalDuplicateLineUp'},
  {'n', '<A-?>', '<Plug>NormalDuplicateBlockRight'},

  {'x', '<A-M>', '<Plug>VisualDuplicateBlockLeft'},
  {'x', '<A-<>', '<Plug>VisualDuplicateLineDown'},
  {'x', '<A->>', '<Plug>VisualDuplicateLineUp'},
  {'x', '<A-?>', '<Plug>VisualDuplicateBlockRight'},

  {'n', '<A-h>', '<Plug>NormalMoveLineLeft'},
  {'n', '<A-j>', '<Plug>NormalMoveBlockDown'},
  {'n', '<A-k>', '<Plug>NormalMoveBlockUp'},
  {'n', '<A-l>', '<Plug>NormalMoveLineRight'},

  {'x', '<A-h>', '<Plug>VisualMoveLineLeft'},
  {'x', '<A-j>', '<Plug>VisualMoveBlockDown'},
  {'x', '<A-k>', '<Plug>VisualMoveBlockUp'},
  {'x', '<A-l>', '<Plug>VisualMoveLineRight'},

  {'n', '<A-H>', '<Plug>NormalDuplicateLineLeft'},
  {'n', '<A-J>', '<Plug>NormalDuplicateBlockDown'},
  {'n', '<A-K>', '<Plug>NormalDuplicateBlockUp'},
  {'n', '<A-L>', '<Plug>NormalDuplicateLineRight'},

  {'x', '<A-H>', '<Plug>VisualDuplicateLineLeft'},
  {'x', '<A-J>', '<Plug>VisualDuplicateBlockDown'},
  {'x', '<A-K>', '<Plug>VisualDuplicateBlockUp'},
  {'x', '<A-L>', '<Plug>VisualDuplicateLineRight'},

  {'n', 'gm', ':lua require("motion-gomove-test").MoveMotion()<CR>', {silent=true}},
})

return M
