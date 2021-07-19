local M = {}
local api = vim.api

-- --Delete buffers that are named directories, empty, and is not readable
-- function M.exibuf()
--   local buffers = api.nvim_list_bufs()
--   for buffer in ipairs(buffers) do
--     local buffername = api.nvim_buf_get_name(buffer)
--     if vim.fn.isdirectory(buffername) == 1 then
--       local currentbufferlines = api.nvim_buf_get_lines(buffer, 1, -1, true)
--       if next(currentbufferlines) == nil then
--         api.nvim_buf_delete(buffer, {})
--       end
--     end
--   end
-- end
-- vim.cmd("command! Exi lua require('custom-functions').exibuf()")
-- vim.cmd([[
-- augroup ExiBuf
-- autocmd BufReadPre * Exi
-- augroup END
-- ]])

--Set Value of Tabstop and shiftwidth
function M.tabchange()
  local newChar = vim.fn.nr2char(vim.fn.getchar())
  local toSet = math.floor(newChar)
  vim.bo.tabstop = toSet
  vim.bo.shiftwidth = toSet
  print('Tab size changed to '..toSet..'!')
end
vim.cmd("nnoremap <silent><leader>tab :lua require('custom-functions').tabchange()<CR>")

return M
