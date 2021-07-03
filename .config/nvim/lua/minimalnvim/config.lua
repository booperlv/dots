--Require custom functions
require('custom-functions')


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

--Commentor
require('nvim_comment').setup()

--Color Selector
vim.g.cyclecolo_attach_events = { 'dofile("/home/booperlv/.config/minimalnvim/lua/statusline.lua")', 'dofile("/home/booperlv/.config/minimalnvim/lua/top-bufferline.lua")',}
require("cyclecolo").setup()

--Zen Mode
require("zen-mode").setup {}

--Require Status Line Configuration File
dofile("/home/booperlv/.config/minimalnvim/lua/statusline.lua")

--Require Buffer Line Configuration File
dofile("/home/booperlv/.config/minimalnvim/lua/top-bufferline.lua")
