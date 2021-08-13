local M = {}

local api = vim.api

M.trunc_width = {
  filename   = 140,
  diagnostic = 90,
  git_status = 70,
  mode       = 50,
}
M.is_truncated = function(width)
  local current_width = api.nvim_win_get_width(0)
  return current_width < width
end


M.colors = {
  active        = '%#StatusLine#',
  inactive      = '%#StatusLineNC#',
  normal        = '%#Normal#',
}

M.separators = {
  line = " | ",
  blank = " ",
  left_block = "▌ ",
  right_block = " ▐"
}

local active_sep = 'line'

--Components!!

-- I only ever use like a few components,
-- +Mode, +Filename, +Diagnostics
-- Git, +Progress, +Line-Column, +LSP Server Name

M.modes = {
  ['n']  = {'NORMAL', 'N'};
  ['no'] = {'N-PENDING', 'N-P'} ;
  ['v']  = {'VISUAL', 'V' };
  ['V']  = {'V-LINE', 'V-L' };
  [''] = {'V-BLOCK', 'V-B'};
  ['s']  = {'SELECT', 'S'};
  ['S']  = {'S-LINE', 'S-L'};
  [''] = {'S-BLOCK', 'S-B'};
  ['i']  = {'INSERT', 'I'};
  ['ic'] = {'INSERT', 'I'};
  ['ix'] = {'INSERT', 'I'};
  ['R']  = {'REPLACE', 'R'};
  ['Rv'] = {'V-REPLACE', 'V-R'};
  ['Rx'] = {'REPLACE', 'R'};
  ['c']  = {'COMMAND', 'C'};
  ['cv'] = {'EX', 'E'};
  ['ce'] = {'EX', 'E'};
  ['r']  = {'REPLACE', 'R'};
  ['rm'] = {'MORE ', 'M'};
  ['r?'] = {'CONFIRM ', 'C'};
  ['!']  = {'SHELL', 'S'};
  ['t']  = {'TERMINAL', 'T'};
}

M.get_current_mode = function()
  local current_mode = vim.fn.mode()
  if M.is_truncated(M.trunc_width.mode) then
    -- return string.format('%s', M.modes[current_mode][2])
    return M.modes[current_mode][2]
  end
  -- return string.format('%s', M.modes[current_mode][1])
    return M.modes[current_mode][1]
end


M.get_filename = function()
  if M.is_truncated(M.trunc_width.filename) then return "%<%f" end
  return "%<%F"
end

local function ReturnHighlightTerm(group)
  local output = vim.fn.execute('hi '..group)
  return {
    fg = vim.fn.matchstr(output, "guifg"..[[=\zs\S*]]),
    bg = vim.fn.matchstr(output, "guibg"..[[=\zs\S*]]),
    gui = vim.fn.matchstr(output, "gui"..[[=\zs\S*]]),
  }
end
M.get_lsp_diagnostic = function()
  local result = {}
  local levels = {
    errors = 'Error',
    warnings = 'Warning',
    info = 'Information',
    hints = 'Hint'
  }
  for k, level in pairs(levels) do
    result[k] = vim.lsp.diagnostic.get_count(0, level)
  end
  if M.is_truncated(M.trunc_width.diagnostic) then
    return ''
  else
    local tab_of_strings = {}
    if result['errors'] ~= 0 then
      local foreground = ReturnHighlightTerm('LspDiagnosticsSignError')['fg']
      local background = ReturnHighlightTerm('StatusLine')['bg']
      vim.cmd("hi LuaStatusError  guifg = "..foreground.." guibg = "..background) 
      table.insert(tab_of_strings, "%#LuaStatusError# :"..result['errors'].." ")
    end
    if result['warnings'] ~= 0 then
      local foreground = ReturnHighlightTerm('LspDiagnosticsSignWarning')['fg']
      local background = ReturnHighlightTerm('StatusLine')['bg']
      vim.cmd("hi LuaStatusWarning guifg = "..foreground.." guibg = "..background) 
      table.insert(tab_of_strings, "%#LuaStatusWarning# :"..result['warnings'].." ")
    end
    if result['info'] ~= 0 then
      local foreground = ReturnHighlightTerm('LspDiagnosticsSignInformation')['fg']
      local background = ReturnHighlightTerm('StatusLine')['bg']
      vim.cmd("hi LuaStatusInformation guifg = "..foreground.." guibg = "..background) 
      table.insert(tab_of_strings, "%#LuaStatusInformation# :"..result['info'].." ")
    end
    if result['hints'] ~= 0 then
      local foreground = ReturnHighlightTerm('LspDiagnosticsSignHint')['fg']
      local background = ReturnHighlightTerm('StatusLine')['bg']
      vim.cmd("hi LuaStatusHint guifg = "..foreground.." guibg = "..background) 
      table.insert(tab_of_strings, "%#LuaStatusHint# :"..result['hints'])
    end
    return table.concat(tab_of_strings)
  end
end


-------------Right side time-------------


M.get_git_status = function()
  --TODO
  --The general idea is I basically have three things to make here
  --the added, changed, removed, and the head.
  
end

M.get_line_col = function()
  return '%l,%c'
end

M.get_progress = function()
  return '%3P'
end

M.get_lsp_server_name = function ()
  local msg = 'none'
  local buf_ft = vim.api.nvim_buf_get_option(0,'filetype')
  local clients = vim.lsp.get_active_clients()
  if next(clients) == nil then return msg end
  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      return client.name
    end
  end
  return msg
end


--------------Main section--------------

M.set_active = function()
  local colors = M.colors

  local sep = colors.inactive .. M.separators[active_sep]
  local left_sep = colors.inactive .. M.separators['left_block']
  local right_sep = colors.inactive .. M.separators['right_block']

  local mode =  M.get_current_mode()
  local filename =  M.get_filename()
  local diagnostics =  M.get_lsp_diagnostic()

  local line_col =  M.get_line_col()
  local progress =  M.get_progress()
  local lsp_name =  M.get_lsp_server_name()

  return table.concat({
    colors.active, left_sep, mode, sep, diagnostics, sep,
    '%=', filename, '%=',
    sep, line_col, sep, progress, sep, lsp_name, right_sep
  })
end

M.set_inactive = function()
  local left_sep = M.colors.inactive .. M.separators['left_block']
  local right_sep = M.colors.inactive .. M.separators['right_block']
  
  return table.concat({M.colors.inactive, left_sep, '%= %F %=', right_sep})
end

M.set_explorer = function()
  local title = '   '
  local title_alt = M.separators[active_sep]

  return table.concat({ M.colors.active, title, title_alt })
end


--Set it

Statusline = function(mode)
  return M["set_" .. mode]()
end

api.nvim_exec([[
  augroup Statusline
    au!
    au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline('active')
    au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline('inactive')
    au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline('explorer')
  augroup END
]], false)

return M
