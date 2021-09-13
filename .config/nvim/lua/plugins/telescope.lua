local conf = require('mappings')
conf.map({
  {'n', '  ', ':Telescope find_files<CR>'},
  {'n', ' ct', ':Telescope colorscheme<CR>'},
  {'n', ' ff', ':Telescope live_grep<CR>'},
  {'n', ' fb', ':Telescope buffers<CR>'},
  {'n', ' fh', ':Telescope help_tags<CR>'},
  {'n', ' fdd', ':Telescope lsp_document_diagnostics<CR>'},
  {'n', ' fdw', ':Telescope lsp_workspace_diagnostics<CR>'},
})

local telescope = require('telescope')
telescope.setup {
  -- extensions = {
  --   cyclecolo = {
  --     enable_preview = true,
  --   },
  -- },
}
-- telescope.load_extension('cyclecolo')
