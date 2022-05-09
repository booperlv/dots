require('nvim-tree').setup({
  view = {
    side = 'right',
    width = '25%',
  },
  update_cwd = true,
})

vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_create_in_closed_folder = 0

vim.g.nvim_tree_show_icons = {
	git = 1, folders = 1, files = 1
}
