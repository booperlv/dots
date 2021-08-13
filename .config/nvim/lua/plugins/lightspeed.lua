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
