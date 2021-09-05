local conf = require('mappings')
conf.map({
  {'n', '  ', ':Telescope find_files<CR>'},
  {'n', ' ct', ':Telescope cyclecolo<CR>'},
  {'n', ' ff', ':Telescope live_grep<CR>'},
  {'n', ' fb', ':Telescope buffers<CR>'},
  {'n', ' fh', ':Telescope help_tags<CR>'},
})

local telescope = require('telescope')
telescope.setup {
  pickers = {

  },
  extensions = {
    cyclecolo = {
      enable_preview = true,
    },
  },
}
telescope.load_extension('cyclecolo')
