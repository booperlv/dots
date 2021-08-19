local snap = require'snap'
snap.maps {
  {"<Leader><Leader>", snap.config.file   {producer = "ripgrep.file", prompt="File", suffix=" ~"}},
  {"<Leader>fb", snap.config.file         {producer = "vim.buffer", prompt="Buffer", suffix=" ~"}},
  {"<Leader>fo", snap.config.file         {producer = "vim.oldfile", prompt="OldFile", suffix=" ~"}},
  {"<Leader>ff", snap.config.vimgrep      {prompt="VimGrep", suffix=" ~"}},
}
