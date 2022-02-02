require("pounce").setup({
  accept_keys = "NTESIRIAOHDKLVPBJGMUCFYXWQZ"
})

local map = require("mappings").map

map {
  {"n", "s", "<CMD>Pounce<CR>", {}},
  {"v", "s", "<CMD>Pounce<CR>", {}},
  {"o", "gs", "<CMD>Pounce<CR>", {}},
}
