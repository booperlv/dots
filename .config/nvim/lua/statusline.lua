--evilline
local lualine = require'lualine'

vim.g.StatusLineBackground = vim.fn.ReturnHighlightTerm('StatusLine', 'guibg')
vim.g.StatusLineForeground = vim.fn.ReturnHighlightTerm('StatusLine', 'guifg')
vim.g.StatusLineHorizontalSplit = vim.fn.ReturnHighlightTerm('VertSplit', 'guifg')
--vim.g.StatusLineYellow = vim.fn.ReturnHighlightTerm('Search', 'guibg')
--vim.g.StatusLineCyan = vim.fn.ReturnHighlightTerm('Folded', 'guibg')
--vim.g.StatusLineDarkBlue = vim.fn.ReturnHighlightTerm('Question', 'guifg')
--vim.g.StatusLineGreen = vim.fn.ReturnHighlightTerm('Folded', 'guifg')
--vim.g.StatusLineOrange = vim.fn.ReturnHighlightTerm('WarningMsg', 'guifg')
--vim.g.StatusLineViolet = vim.fn.ReturnHighlightTerm('CursorLineNr', 'guifg')
--vim.g.StatusLineMagenta = vim.fn.ReturnHighlightTerm('PurpleSign', 'guifg')
--vim.g.StatusLineBlue = vim.fn.ReturnHighlightTerm('Title', 'guifg')
--vim.g.StatusLineRed = vim.fn.ReturnHighlightTerm('ErrorMsg', 'guifg')

-- Color table for highlights
local colors = {
  bg       = vim.g.StatusLineBackground,
  fg       = vim.g.StatusLineForeground,
  split    = vim.g.StatusLineHorizontalSplit,
  yellow   = '#EBCB8B',
  cyan     = '#C0C6CF',
  green    = '#BBE67E',
  orange   = '#DE563A',
  blue     = '#81A1C1';
  red      = '#DF8890';
  
  --yellow   = vim.g.StatusLineYellow,
  --cyan     = vim.g.StatusLineCyan,
  --darkblue = vim.g.StatusLineDarkBlue,
  --green    = vim.g.StatusLineGreen,
  --orange   = vim.g.StatusLineOrange,
  --violet   = vim.g.StatusLineViolet,
  --magenta  = vim.g.StatusLineMagenta,
  --blue     = vim.g.StatusLineBlue,
  --red      = vim.g.StatusLineRed,
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
 --function() return '' end,
 function() return '▌' end,
 color = {fg = colors.fg}, -- Sets highlighting of component
 left_padding = 0 -- We don't need space before this
}


ins_left {
  -- mode component
  function()
    -- auto change color according to neovims mode
    local mode_color = {
      n      = colors.red,
      i      = colors.fg,
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
    vim.api.nvim_command('hi! LualineMode guifg='..mode_color[vim.fn.mode()] .. " guibg="..colors.bg)
    return '  ﲎ '
  end,
  color = "LualineMode",
  left_padding = 0,
}

ins_left {
  'filename',
  condition = conditions.buffer_not_empty,
  color = {fg = colors.fg, gui = 'bold'},
}

--ins_left {
--  'location',
--  color = {fg = colors.darkblue, gui = 'bold'}
--}

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
  'o:encoding', -- option component same as &encoding in viml
  condition = conditions.hide_in_width,
  color = {fg = colors.fg, gui = 'bold'}
}

ins_right {
  'fileformat',
  icons_enabled = true, -- I think icons are cool but Eviline doesn't have them. sigh
  color = {fg = colors.fg, gui='bold'},
}

ins_right {
  'branch',
  icon = '',
  condition = conditions.check_git_workspace,
  color = {fg = colors.fg, gui = 'bold'},
}

ins_right {
  'diff',
  -- Is it me or the symbol for modified us really weird
  symbols = {added= ' ', modified= ' ', removed= ' '},
  color_added = colors.green,
  color_modified = colors.orange,
  color_removed = colors.red,
  condition = conditions.hide_in_width
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
  color = {fg = colors.fg, gui = 'bold'}
}

ins_right {
  function() return '▐' end,
  color = {fg = colors.fg},
  right_padding = 0,
}

lualine.setup(config)
