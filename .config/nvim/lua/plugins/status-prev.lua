--evilline
local lualine = require'lualine'

local function ReturnHighlightTerm(group, term)
  local output = vim.fn.execute('hi '..group)
  return vim.fn.matchstr(output, term..[[=\zs\S*]])
end

local StatusLineBackground = ReturnHighlightTerm('StatusLine', 'guibg')
local StatusLineForeground = ReturnHighlightTerm('StatusLine', 'guifg')
local StatusLineHorizontalSplit = ReturnHighlightTerm('VertSplit', 'guifg')

-- Color table for highlights
local colors = {
  bg       = StatusLineBackground,
  fg       = StatusLineForeground,
  split    = StatusLineHorizontalSplit,
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = "",
    section_separators = "",
    theme = {
      normal = { c = {fg = colors.fg, bg = colors.bg}},
      inactive = { c = {fg = colors.bg, bg = colors.bg, gui = 'standout'}}
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
    --This is so that we can actually use the statuslinenc stuff
    lualine_a = {' '},
    lualine_v = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
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
  padding = 0
}

ins_left {'mode'}

ins_left {
  function() return '|' end,
  padding = 0
}

ins_left {
  'filename',
  file_status = true,
}

ins_left {
  function() return '|' end,
  padding = 0
}

ins_left {
  'diagnostics',
  sources = {'nvim_lsp'},
}


-- Add components to right sections


ins_right {
  'branch',
}

ins_right {
  'diff',
}

ins_right {
  function() return '|' end,
  padding = 0
}

ins_right { 'progress' }

ins_right {
  function() return '|' end,
  padding = 0
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
}

ins_right {
  function() return '▐' end,
  padding = 0,
}

lualine.setup(config)
