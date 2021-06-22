local M = {}
local api = vim.api

--Delete the buffers that are named directories and empty on file read
function M.exibuf()
    local buffers = api.nvim_list_bufs()
    for buffer in ipairs(buffers) do
        local buffername = api.nvim_buf_get_name(buffer)
        if vim.fn.isdirectory(buffername) == 1 then
            local currentbufferlines = api.nvim_buf_get_lines(buffer, 1, -1, true)
            if next(currentbufferlines) == nil then
                if api.nvim_buf_get_name(buffer) ~= '' then
                    api.nvim_buf_delete(buffer, {})
                end
            end
        end
    end
end
vim.cmd("command! Exi lua require('custom-functions').exibuf()")
vim.cmd([[
    augroup ExiBuf
    autocmd BufRead * Exi
    augroup END
]])

return M
