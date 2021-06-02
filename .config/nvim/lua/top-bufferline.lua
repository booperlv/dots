require "bufferline".setup {
    options = {
        offsets = {{filetype = "NvimTree", text = "Explorer"}},
        buffer_close_icon = "",
        modified_icon = "",
        close_icon = " ",
        left_trunc_marker = " ",
        right_trunc_marker = " ",
        tab_size = 18,
        show_tab_indicators = true,
        enforce_regular_tabs = false,
        view = "multiwindow",
        show_buffer_close_icons = false,
        separator_style = {"",""}, 
        indicator_icon = "",
        mappings = "true"
    },

    highlights = {
        fill = {
            guifg = {attribute="fg",highlight="TabLine"}, 
            guibg = {attribute="bg",highlight="TabLine"} 
        },
        background = {
            guifg = {attribute="fg",highlight="TabLine"}, 
            guibg = {attribute="bg",highlight="TabLine"} 
        },

        buffer_selected = {
            guifg = {attribute="fg",highlight="TabLineSel"},
            guibg = {attribute="bg",highlight="TabLineSel"},
            gui = "bold"
        },
        buffer_visible = {
            guifg = {attribute="fg",highlight="TabLine"},
            guibg = {attribute="bg",highlight="TabLine"}
        },

        tab_selected = {
            guifg = {attribute="fg",highlight="TabLineSel"}, 
            guibg = {attribute="bg",highlight="TabLineSel"} 
        },
        tab = {
            guifg = {attribute="fg",highlight="TabLine"},
            guibg = {attribute="bg",highlight="TabLine"} 
        },

        separator = {
            guifg = {attribute="bg",highlight="TabLine"},
            guibg = {attribute="bg",highlight="TabLine"}
        },
        separator_selected = {
            guifg = {attribute="bg",highlight="TabLine"},
            guibg = {attribute="bg",highlight="TabLine"}
        },
        separator_visible = {
            guifg = {attribute="bg",highlight="TabLine"},
            guibg = {attribute="bg",highlight="TabLine"}
        },

        indicator_selected = {
            guifg = {attribute="bg",highlight="TabLine"},
            guibg = {attribute="bg",highlight="TabLine"}
        },

        modified_selected = {
            guifg = {attribute="fg",highlight="TabLineSel"},
            guibg = {attribute="bg",highlight="TabLineSel"}
        },
        modified_visible = {
            guifg = {attribute="fg",highlight="TabLine"},
            guibg = {attribute="bg",highlight="TabLine"} 
        }
    }
}
