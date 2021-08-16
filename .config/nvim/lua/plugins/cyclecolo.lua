--Color Selector
require("cyclecolo").setup{
  window_border = 'rounded',
  hover_colors = true,
  attach_events = {
    'dofile("/home/booperlv/.config/nvim/lua/custom-components/statusline/init.lua")',
    'dofile("/home/booperlv/.config/nvim/lua/plugins/bufferline.lua")',
  },
  filter_colorschemes = 'defaults',
  child_cycles = {
    { colorscheme = "tokyonight", variable = "vim.g.tokyonight_style", values = {"storm", "night", "day"}},
    { colorscheme = "material", variable = "vim.g.material_style", values = {"palenight", "oceanic", "darker", "lighter", "deep ocean"}},
  },
}
