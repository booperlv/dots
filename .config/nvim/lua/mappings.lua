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

  {"n", "<A-m>", "<Plug>GoNSMLeft"},
  {"n", "<A-,>", "<Plug>GoNSMDown"},
  {"n", "<A-.>", "<Plug>GoNSMUp"},
  {"n", "<A-/>", "<Plug>GoNSMRight"},

  {"x", "<A-m>", "<Plug>GoVSMLeft"},
  {"x", "<A-,>", "<Plug>GoVSMDown"},
  {"x", "<A-.>", "<Plug>GoVSMUp"},
  {"x", "<A-/>", "<Plug>GoVSMRight"},

  {"n", "<A-M>", "<Plug>GoNSDLeft"},
  {"n", "<A-<>", "<Plug>GoNSDDown"},
  {"n", "<A->>", "<Plug>GoNSDUp"},
  {"n", "<A-?>", "<Plug>GoNSDRight"},

  {"x", "<A-M>", "<Plug>GoVSDLeft"},
  {"x", "<A-<>", "<Plug>GoVSDDown"},
  {"x", "<A->>", "<Plug>GoVSDUp"},
  {"x", "<A-?>", "<Plug>GoVSDRight"},

  -- {'n', '<A-m>', '<Plug>GoNMBlockLeft'},
  -- {'n', '<A-,>', '<Plug>GoNMLineDown'},
  -- {'n', '<A-.>', '<Plug>GoNMLineUp'},
  -- {'n', '<A-/>', '<Plug>GoNMBlockRight'},
  --
  -- {'x', '<A-m>', '<Plug>GoVMBlockLeft'},
  -- {'x', '<A-,>', '<Plug>GoVMLineDown'},
  -- {'x', '<A-.>', '<Plug>GoVMLineUp'},
  -- {'x', '<A-/>', '<Plug>GoVMBlockRight'},
  -- --
  -- {'n', '<A-M>', '<Plug>GoNDBlockLeft'},
  -- {'n', '<A-<>', '<Plug>GoNDLineDown'},
  -- {'n', '<A->>', '<Plug>GoNDLineUp'},
  -- {'n', '<A-?>', '<Plug>GoNDBlockRight'},
  --
  -- {'x', '<A-M>', '<Plug>GoVDBlockLeft'},
  -- {'x', '<A-<>', '<Plug>GoVDLineDown'},
  -- {'x', '<A->>', '<Plug>GoVDLineUp'},
  -- {'x', '<A-?>', '<Plug>GoVDBlockRight'},
  -- --
  -- {'n', '<A-h>', '<Plug>GoNMLineLeft'},
  -- {'n', '<A-j>', '<Plug>GoNMBlockDown'},
  -- {'n', '<A-k>', '<Plug>GoNMBlockUp'},
  -- {'n', '<A-l>', '<Plug>GoNMLineRight'},
  --
  -- {'x', '<A-h>', '<Plug>GoVMLineLeft'},
  -- {'x', '<A-j>', '<Plug>GoVMBlockDown'},
  -- {'x', '<A-k>', '<Plug>GoVMBlockUp'},
  -- {'x', '<A-l>', '<Plug>GoVMLineRight'},
  -- --
  -- {'n', '<A-H>', '<Plug>GoNDLineLeft'},
  -- {'n', '<A-J>', '<Plug>GoNDBlockDown'},
  -- {'n', '<A-K>', '<Plug>GoNDBlockUp'},
  -- {'n', '<A-L>', '<Plug>GoNDLineRight'},
  -- --
  -- {'x', '<A-H>', '<Plug>GoVDLineLeft'},
  -- {'x', '<A-J>', '<Plug>GoVDBlockDown'},
  -- {'x', '<A-K>', '<Plug>GoVDBlockUp'},
  -- {'x', '<A-L>', '<Plug>GoVDLineRight'},

  {'n', 'gm', ':lua require("motion-gomove-test").MoveMotion()<CR>', {silent=true}},
})

return M
