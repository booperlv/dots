--evilline
local lualine = require'lualine'

vim.g.StatusLineBackground = vim.fn.ReturnHighlightTerm('StatusLine', 'guibg')
vim.g.StatusLineForeground = vim.fn.ReturnHighlightTerm('StatusLine', 'guifg')
vim.g.StatusLineHorizontalSplit = vim.fn.ReturnHighlightTerm('VertSplit', 'guifg')

vim.g.TabLineSelBackground = vim.fn.ReturnHighlightTerm('TabLineSel', 'guibg')
vim.g.TabLineSelForeground = vim.fn.ReturnHighlightTerm('TabLineSel', 'guifg')
local function isempty(s)
  return s == nil or s == ''
end
if isempty(vim.g.TabLineSelBackground) then
    vim.g.TabLineSelBackground = vim.fn.ReturnHighlightTerm('Normal', 'guibg')
end
if isempty(vim.g.TabLineSelForeground) then 
    vim.g.TabLineSelForeground = vim.fn.ReturnHighlightTerm('Normal', 'guifg')
end

-- Color table for highlights
local colors = {
  bg       = vim.g.StatusLineBackground,
  fg       = vim.g.StatusLineForeground,
  split    = vim.g.StatusLineHorizontalSplit,
  colbg    = vim.g.TabLineSelBackground,
  colfg    = vim.g.TabLineSelForeground,
  yellow   = '#EBCB8B',
  cyan     = '#C0C6CF',
  green    = '#BBE67E',
  orange   = '#DE563A',
  blue     = '#81A1C1';
  red      = '#DF8890';
}
local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = "",
    section_separators = "",
    theme = {
      normal = { c = {fg = colors.fg, bg = colors.bg}},
      inactive = { c = {fg = vim.g.StatusLineHorizontalSplit, guibg = 'none', gui = 'underline'}}
    },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- The one section with text for a horizontal separator
    lualine_a = {' '},
    lualine_v = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  }
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end













ins_left {
 function() return '▌' end,
 color = {fg=colors.fg, bg=colors.colbg},
 padding = 0
}


ins_left {
  -- mode component
  function()
    -- auto change color according to neovims mode
    local mode_color = {
      n      = colors.colbg,
      i      = colors.red,
      v      = colors.yellow,
      [''] = colors.yellow,
      V      = colors.yellow,
      c      = colors.blue,
      no     = colors.red,
      s      = colors.orange,
      S      = colors.orange,
      [''] = colors.orange,
      ic     = colors.green,
      R      = colors.green,
      Rv     = colors.green,
      cv     = colors.red,
      ce     = colors.red,
      r      = colors.cyan,
      rm     = colors.cyan,
      ['r?'] = colors.cyan,
      ['!']  = colors.red,
      t      = colors.remagentad
    }
    vim.api.nvim_command('hi! LualineMode guifg=' ..colors.colfg .." guibg="..mode_color[vim.fn.mode()])
    return '  ﲎ '
  end,
  color = "LualineMode", 
}

ins_left {
  'filename',
  condition = conditions.buffer_not_empty,
  color = {fg = colors.fg, gui = 'bold'},
}

ins_left {
  'diagnostics',
  sources = {'nvim_lsp'},
  symbols = {error = ' ', warn = ' ', info= ' '},
  color_error = colors.red,
  color_warn = colors.yellow,
  color_info = colors.cyan,
}



-- Add components to right sections

ins_right {
  'progress',
  color = {fg = colors.fg, gui = 'bold'},
}


ins_right {
  'branch',
  icon = '',
  condition = conditions.check_git_workspace,
  color = {fg = colors.fg, gui = 'bold'},
}

ins_right {
  'diff',
  symbols = {added= ' ', modified= ' ', removed= ' '},
  color_added = colors.green,
  color_modified = colors.orange,
  color_removed = colors.red,
  condition = conditions.hide_in_width,
  color = {fg = colors.fg},
}

ins_right {
    'fileformat',
    icons_enabled = true,
    color = {fg = colors.colfg, bg=colors.colbg, gui='bold'},
}

ins_right {
  -- Lsp server name .
  function ()
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
  end,
  color = {fg = colors.colfg, bg=colors.colbg, gui = 'bold'},
}

ins_right {
  function() return '▐' end,
  color = {fg=colors.fg, bg=colors.colbg},
  padding = 0,
}

lualine.setup(config)
