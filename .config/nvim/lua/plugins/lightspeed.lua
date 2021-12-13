--Lightspeed
require'lightspeed'.setup {
  limit_ft_matches = 1,
  --Colemak labels
  labels = {"t", "n", "s", "e", "r", "i", "a", "o", "f", "u",
            "w", "y", "d", "h", "v", "k", "c", "m", "q", ";"},
  --Keys
  cycle_group_fwd_key = "<tab>",
  cycle_group_bwd_key = "<s-tab>",
}

require'mappings'.map({
  {'n', '<leader>', '<Plug>Lightspeed_x'},
  {'n', '<S-leader>', '<Plug>Lightspeed_x'},
})
