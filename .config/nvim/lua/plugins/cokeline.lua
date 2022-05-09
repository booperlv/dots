local get_hex = require('cokeline/utils').get_hex

require('cokeline').setup({
  default_hl = {
    fg = function(buffer)
      return
        buffer.is_focused
        and get_hex('TabLineSel', 'fg')
         or get_hex('TabLine', 'fg')
    end,
    bg = function(buffer)
      return
        buffer.is_focused
        and get_hex('TabLineSel', 'bg')
         or get_hex('TabLine', 'bg')
    end,
  },

  components = {
    {
      text = function(buffer) return ' ' .. buffer.devicon.icon end,
      fg = function(buffer) return buffer.devicon.color end,
      bg = function(buffer)
        return
          buffer.is_focused
          and get_hex('Normal', 'fg')
           or get_hex('Normal', 'bg')
      end
    },
    {
      text = ' ',
    },
    {
      text = function(buffer) return buffer.unique_prefix end,
      fg = get_hex('TabLineSel', 'fg'),
      style = 'italic',
    },
    {
      text = function(buffer) return buffer.filename .. ' ' end,
    },
    {
      text = '',
      delete_buffer_on_left_click = true,
    },
    {
      text = ' ',
    }
  },
})
