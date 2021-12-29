local M = {}

local api = vim.api

M.trunc_width = {
  filename   = 140,
  diagnostic = 90,
  git_status = 90,
  mode       = 60,
}
M.is_truncated = function(width)
  local current_width = api.nvim_win_get_width(0)
  return current_width < width
end

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

-------------Left side-------------

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
    return M.modes[current_mode][2]
  end
    return M.modes[current_mode][1]
end


M.get_git_status = function()
  -- use fallback because it doesn't set this variable on the initial `BufEnter`
  local signs = vim.b.gitsigns_status_dict or {head = '', added = 0, changed = 0, removed = 0}
  local is_head_empty = signs.head ~= ''

  if M.is_truncated(M.trunc_width.git_status) then
    return is_head_empty and string.format(' %s', signs.head or '') or ''
  end

  return is_head_empty
    and string.format(
      '+%s ~%s -%s |  %s',
      signs.added, signs.changed, signs.removed, signs.head
    )
    or ''
end


--echo synIDattr(synIDtrans(hlID('StatusLine')), 'bold')
local function get_color(group, attr)
  local fn = vim.fn
  return fn.synIDattr(fn.synIDtrans(fn.hlID(group)), attr)
end

local function get_all_diagnostics()
  local result = {}
  local levels = {
    errors = vim.diagnostic.severity.ERROR,
    warnings = vim.diagnostic.severity.WARN,
    info = vim.diagnostic.severity.INFO,
    hints = vim.diagnostic.severity.HINT,
  }
  for k, level in pairs(levels) do
    local count = #vim.diagnostic.get(0, {severity=level})
    result[k] = count
  end

  return result
end

M.get_lsp_diagnostic = function()
  local diagnostics = get_all_diagnostics()

  local tab_of_strings = {}
  local background = "guibg="..get_color('StatusLine', 'bg#')

  local gui = {}
  local gui_values = {'bold', 'italic', 'reverse', 'inverse', 'standout', 'underline', 'undercurl', 'strikethrough'}
  --Get the gui tags
  for _, value in ipairs(gui_values) do
    if get_color('StatusLine', value) == "1" then
      table.insert(gui, value)
    end
  end
  gui = (next(gui) == nil and '' or 'gui='..table.concat(gui,","))

  local error_foreground = "guifg="..get_color('DiagnosticError', 'fg#')
  local warn_foreground = "guifg="..get_color('DiagnosticWarn', 'fg#')
  local info_foreground = "guifg="..get_color('DiagnosticInfo', 'fg#')
  local hint_foreground = "guifg="..get_color('DiagnosticHint', 'fg#')

  api.nvim_command(table.concat({"hi", "LuaStatusError", background, error_foreground, gui}, " "))
  api.nvim_command(table.concat({"hi", "LuaStatusWarning", background, warn_foreground, gui}, " "))
  api.nvim_command(table.concat({"hi", "LuaStatusInformation", background, info_foreground, gui}, " "))
  api.nvim_command(table.concat({"hi", "LuaStatusHint", background, hint_foreground, gui}, " "))

  if M.is_truncated(M.trunc_width.diagnostic) then
    if diagnostics['errors'] ~= 0 then--{{{
      table.insert(tab_of_strings, "%#LuaStatusError#"..diagnostics['errors'])
    end
    if diagnostics['warnings'] ~= 0 then
      table.insert(tab_of_strings, "%#LuaStatusWarning#"..diagnostics['warnings'])
    end
    if diagnostics['info'] ~= 0 then
      table.insert(tab_of_strings, "%#LuaStatusInformation#"..diagnostics['info'])
    end
    if diagnostics['hints'] ~= 0 then
      table.insert(tab_of_strings, "%#LuaStatusHint#"..diagnostics['hints'])
    end
--}}}
  else
    if diagnostics['errors'] ~= 0 then--{{{
      table.insert(tab_of_strings, "%#LuaStatusError# :"..diagnostics['errors'])
    end
    if diagnostics['warnings'] ~= 0 then
      table.insert(tab_of_strings, "%#LuaStatusWarning# :"..diagnostics['warnings'])
    end
    if diagnostics['info'] ~= 0 then
      table.insert(tab_of_strings, "%#LuaStatusInformation# :"..diagnostics['info'])
    end
    if diagnostics['hints'] ~= 0 then
      table.insert(tab_of_strings, "%#LuaStatusHint# :"..diagnostics['hints'])
    end
--}}}
  end

  table.insert(tab_of_strings, "%#StatusLine#")

  return table.concat(tab_of_strings)
end


-------------Center time-------------

M.get_filename = function()
  local filename = vim.fn.expand('%:t')
  if filename == '' then filename = '[No Name]' end
  local relativepath = vim.fn.expand('%:~:.')

  if M.is_truncated(M.trunc_width.filename) then return filename end
  return relativepath
end

-------------Right side time-------------


M.get_line_col = function()
  return '%l,%c'
end

M.get_progress = function()
  return '%3P'
end

M.get_lsp_server_name = function ()
  local function lsp_progress()
    local lsp = vim.lsp.util.get_progress_messages()[1]
    if lsp then
      local name = lsp.name or ""
      local msg = lsp.message or ""
      local percentage = lsp.percentage or 0
      local title = lsp.title or ""
      return string.format(" %%<%s: %s %s (%s%%%%) ", name, title, msg, percentage)
    end
    return ""
  end
  local progress = lsp_progress()
  if progress ~= "" then return progress end

  local msg = "none"
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
  local sep = M.separators[active_sep]
  local left_sep =  M.separators['left_block']
  local right_sep = M.separators['right_block']

  local mode =  M.get_current_mode()
  local git = M.get_git_status()
  local diagnostics =  M.get_lsp_diagnostic()

  local filename =  M.get_filename()

  local line_col =  M.get_line_col()
  local progress =  M.get_progress()
  local lsp_name =  M.get_lsp_server_name()

  return table.concat({
    left_sep, mode, sep, git, sep, diagnostics, sep,
    '%=', filename, '%=',
    sep, line_col, sep, progress, sep, lsp_name, right_sep
  })
end

M.set_inactive = function()
  local left_sep = M.separators['left_block']
  local right_sep = M.separators['right_block']
  return table.concat({left_sep, '%= %t %=', right_sep})
end

M.set_explorer = function()
  local title = '   '
  local title_alt = M.separators[active_sep]

  return table.concat({title, title_alt})
end


--Set it

Statusline = function(mode)
  return M["set_" .. mode]()
end
StatuslineLoad = function(mode)
  vim.cmd("setlocal statusline=%!v:lua.Statusline('"..mode.."')")
end

local events = { 'ColorScheme', 'FileType','BufWinEnter','BufReadPost','BufWritePost',
  'BufEnter','WinEnter','FileChangedShellPost','VimResized','TermOpen'}

api.nvim_command("augroup Statusline")
  local all_active_command = string.format(
    "au %s * lua StatuslineLoad('active')",
    table.concat(events, ",")
  )
  api.nvim_command(all_active_command)
  local nvim_tree_command = string.format(
    "au %s,FileType NvimTree lua StatuslineLoad('explorer')",
    table.concat(events, ",")
  )
  api.nvim_command(nvim_tree_command)
  api.nvim_command("au WinLeave * lua StatuslineLoad('inactive')")
api.nvim_command("augroup END")

return M
