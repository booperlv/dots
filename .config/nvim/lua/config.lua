--Require custom functions
require('custom-functions')
--Require Language Server Configuration File
require('lsp_config')
--Require Treesitter Configuration File
require('treesitter')
--Require Nvim-Compe Configuration File
require('compe-completion')

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
vim.g.cyclecolo_attach_events = { 'dofile("/home/booperlv/.config/nvim/lua/statusline.lua")', 'dofile("/home/booperlv/.config/nvim/lua/top-bufferline.lua")',}
require("cyclecolo").setup()

--Trouble/LSP error indicator
require("trouble").setup {}

--Zen Mode
require("zen-mode").setup {}

--LSP Signatures
require'lsp_signature'.on_attach({
    bind = true,
    hint_enable = true,
    hint_prefix = " ",
    handler_opts = {
        border = "none"
    }
})

--Require Status Line Configuration File
dofile("/home/booperlv/.config/nvim/lua/statusline.lua")

--Require Buffer Line Configuration File
dofile("/home/booperlv/.config/nvim/lua/top-bufferline.lua")
