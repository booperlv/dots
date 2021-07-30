--Files
require('custom-functions')
require('new_lspconfig')
require('treesitter')
require('compe-completion')
require('snap-config')

--Lightspeed
require'lightspeed'.setup {
  jump_to_first_match = true,
  limit_ft_matches = 1,
  full_inclusive_prefix_key = '<leader>',
  --Colemak labels
  labels = {"t", "n", "s", "e", "r", "i", "a", "o", "f", "u",
            "w", "y", "d", "h", "v", "k", "c", "m", "q", ";"},
  --Keys
  cycle_group_fwd_key = "<tab>",
  cycle_group_bwd_key = "<s-tab>",
}

--Autopairs and stuff
require("nvim-autopairs").setup()

--Colorizer
require'colorizer'.setup()

--Commentor
require'kommentary.config'.configure_language("default", {
  prefer_single_line_comments = true,
  use_consistent_indentation = true,
  ignore_whitespace = false,
})
vim.g.kommentary_create_default_bindings=false
vim.api.nvim_set_keymap("n", "<leader>cc", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("n", "<leader>c", "<Plug>kommentary_motion_default", {})
vim.api.nvim_set_keymap("v", "<leader>c", "<Plug>kommentary_visual_default", {})

--Color Selector
require("cyclecolo").setup{
  window_border = 'double',
  -- hover_colors = true,
  attach_events = { 'dofile("/home/booperlv/.config/nvim/lua/statusline.lua")', 'dofile("/home/booperlv/.config/nvim/lua/top-bufferline.lua")',},
  filter_colorschemes = 'defaults',
  child_cycles = {
    { colorscheme = "tokyonight", variable = "vim.g.tokyonight_style", values = {"storm", "night", "day"}},
    { colorscheme = "material", variable = "vim.g.material_style", values = {"palenight", "oceanic", "darker", "lighter", "deep ocean"}},
  },
}

require("gomove").setup{
  -- map_keys = true,
}

-- --Telescope
-- require("telescope").setup {
--   defaults = {
--     borderchars = {"─", "│", "─", "│", "┌", "┐", "┘", "└"},
--   }
-- }

--Trouble/LSP error indicator
require("trouble").setup {}

--Require Status Line Configuration File
dofile("/home/booperlv/.config/nvim/lua/statusline.lua")

--Require Buffer Line Configuration File
dofile("/home/booperlv/.config/nvim/lua/top-bufferline.lua")
