local conf = require('mappings')
conf.map({
  {'n', '  ', ':Telescope find_files<CR>'},
  {'n', ' ct', ':Telescope colorscheme<CR>'},
  {'n', ' ff', ':Telescope live_grep<CR>'},
  {'n', ' fb', ':Telescope buffers<CR>'},
  {'n', ' fh', ':Telescope help_tags<CR>'},
  {'n', ' fdd', ':Telescope diagnostics bufnr=0<CR>'},
  {'n', ' fdw', ':Telescope diagnostics<CR>'},
})

require('telescope').setup{
  defaults = {
    file_ignore_patterns = {"node_modules"}
  },
}
