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

--Toggle lsp autostart
local lsp = require("plugins.lspconfig")
lsp.SetupServers(true)

--Autocmd that handles lspstart
function M.OwnLSPAutoStart()
  lsp = require("plugins.lspconfig")
  if lsp.should_autostart then
    vim.cmd("LspStart")
  end
end
vim.cmd([[
  autocmd BufEnter * lua require('custom-components.functions').OwnLSPAutoStart()
]])
--Toggle a state
function M.ToggleLSPAutoStart()
  lsp = require("plugins.lspconfig")
  if lsp.should_autostart then
    lsp.SetupServers(false)
  else
    lsp.SetupServers(true)
  end
  print("setting server autostart to "..vim.inspect(lsp.should_autostart))
end

vim.api.nvim_set_keymap (
  'n', ' lsts', ":lua require('custom-components.functions').ToggleLSPAutoStart()<CR>",
  {silent = true, nowait = true}
)

return M
