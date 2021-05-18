-- Bufferline setup
local BufferForeground = vim.fn.ReturnHighlightTerm('Comment', 'guifg') 
local BufferBackground = vim.fn.ReturnHighlightTerm('StatusLineNC', 'guibg') 

local SelectedBufferForeground = vim.fn.ReturnHighlightTerm('StatusLine', 'guifg')
local SelectedBufferBackground = vim.fn.ReturnHighlightTerm('StatusLine', 'guibg')

local BufferFillForeground = vim.fn.ReturnHighlightTerm('Normal', 'guifg')
local BufferFillBackground = vim.fn.ReturnHighlightTerm('Normal', 'guibg')

require('bufferline').setup {
    options = {
        offsets = {{filetype = "NvimTree", text = "Explorer"}},
        buffer_close_icon = "",
        modified_icon = "",
        close_icon = " ",
        left_trunc_marker = " ",
        right_trunc_marker = " ",
        show_tab_indicators = true,
        enforce_regular_tabs = true,
        view = "multiwindow",
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        show_close_icons = false,
        separator_style = "thin",
        mappings = "true"
    }
}
