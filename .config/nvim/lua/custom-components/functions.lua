local M = {}
local api = vim.api

--Set Value of Tabstop and shiftwidth
function M.tabchange()
  local newChar = vim.fn.nr2char(vim.fn.getchar())
  local toSet = math.floor(newChar)
  vim.bo.tabstop = toSet
  vim.bo.shiftwidth = toSet
  print('Tab size changed to '..toSet..'!')
end
api.nvim_set_keymap(
  'n', ' tab', ':lua require("custom-functions").tabchange()<CR>',
  {silent = true, nowait = true}
)

--Random Colorscheme
function M.RandColorScheme()
  local colorschemes = vim.fn.getcompletion("", "color")
  local rand_num_between = tonumber(vim.fn.system(
    "echo $((1 + $RANDOM % "..#colorschemes.."))"
  ))
  vim.cmd('colorscheme '..colorschemes[rand_num_between])
  print("switching to "..colorschemes[rand_num_between].."!")
end
api.nvim_set_keymap(
  'n', ' cr', ":lua require('custom-components.functions').RandColorScheme()<CR>",
  {silent = true, nowait = true}
)

--Toggle textwidth
function M.ToggleTextWidth()
  if vim.bo.textwidth == 80 then
    vim.bo.textwidth = 0
  else
    vim.bo.textwidth = 80
  end
  print('set textwidth to '..vim.bo.textwidth)
end
api.nvim_set_keymap(
  'n', ' tw', ":lua require('custom-components.functions').ToggleTextWidth()<CR>",
  {silent = true, nowait = true}
)

return M
