
" --------------
" PLUGIN SECTION
" --------------

" Vim-plug
call plug#begin("~/.config/nvim/plugged")

" Colors
Plug 'ayu-theme/ayu-vim'
Plug 'sonph/onehalf', {'rtp': 'vim'}
Plug 'kjssad/quantum.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'folke/tokyonight.nvim'
Plug 'shaunsingh/moonlight.nvim'
" Css Colorizer
Plug 'norcalli/nvim-colorizer.lua'

" Language Servers
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

" Snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" Auto Closer
" Plug 'tmsvg/pear-tree'
Plug 'windwp/nvim-autopairs'

" TabLine
"Plug 'romgrk/barbar.nvim'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'kyazdani42/nvim-web-devicons'

" File Explorer
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" File Tree
Plug 'kyazdani42/nvim-tree.lua'

" Emmet
Plug 'mattn/emmet-vim'

" Vim Surround
Plug 'tpope/vim-surround'

" Indent Guides
Plug 'lukas-reineke/indent-blankline.nvim', { 'branch': 'lua' }
"Plug 'thaerkh/vim-indentguides'

" Status Line
Plug 'hoob3rt/lualine.nvim'

" Color Picker
Plug 'DougBeney/pickachu'

call plug#end()

" --------------
" CONFIG SECTION
" --------------

" Colorscheme
let ayucolor="mirage"
let background="dark"
colorscheme ayu 
set termguicolors
set t_Co=16

" Set Font for GUI
set guifont=Iosevka:h11

" Plugin Global
filetype plugin indent on
syntax enable

" Encoding
set encoding=UTF-8

" Clipboard
set clipboard=unnamedplus

" Allow Buffer Change No Save
set hidden

" Mouse
set mouse=a

" Cursor Offset from top and bottom
set scrolloff=1
set display+=lastline

" Line Numbers
set number

" No Wrap
set wrap!

" Replace ~ EndOfBuffer
set fillchars=eob:\ 

" Tab Width
set shiftwidth=4 tabstop=4
set autoindent smartindent
set expandtab

" Search and Replace
set ignorecase
set smartcase
set gdefault

" Update Files when changed from other source
set autoread

"Alternative to indent guides since it can be a bit of a hassle sometimes
"set cursorcolumn
set cursorline

" Set Key Timeout
set ttimeoutlen=2
"set notimeout

" Remap Esc -command switch to normal
inoremap nn <esc>
inoremap nxn nn

" Map Leader to space
nnoremap <SPACE> <NOP>
let mapleader=" "

" -------------------------------------
" PLUGIN CONFIG AND KEYBINDINGS SECTION
" -------------------------------------

" IndentLine and Indent-blankline
let g:indentLine_enabled = 1
let g:indent_blankline_char = "▏"
let g:indent_blankline_show_trailing_blankline_indent = v:false
let g:indent_blankline_show_first_indent_level = v:false
" vim-indentline
"let g:indentguides_spacechar = '▏'
"let g:indentguides_tabchar = '▏'

" emmet vim
let g:user_emmet_leader_key='<C-Z>'
nnoremap <leader>em :call feedkeys("<C-Z>,")<CR>

" nvim bufferline
nnoremap <silent><leader>/ :BufferLineCycleNext<CR>
nnoremap <silent><leader>m :BufferLineCyclePrev<CR>
" These commands will move the current buffer backwards or forwards in the bufferline
nnoremap <silent><leader>? :BufferLineMoveNext<CR>
nnoremap <silent><leader>M :BufferLineMovePrev<CR>
" Close buffer
nnoremap <silent><leader>w :bdelete<CR>

" pear-tree
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1
let g:pear_tree_ft_disabled = [ "TelescopePrompt" ]

" nvim-compe
set completeopt=menuone,noselect
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" Nvim Tree
nnoremap <leader>tt :NvimTreeToggle<CR>
nnoremap <leader>tr :NvimTreeRefresh<CR>
nnoremap <leader>tf :NvimTreeFindFile<CR>
let g:nvim_tree_side = 'left' "left by default
let g:nvim_tree_width = 25 "30 by default
let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_width_allow_resize  = 1 "0 by default, will not resize the tree when opening a file
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ }
let g:nvim_tree_quit_on_open = 1

" Telescope.nvim
" Using lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" overwrite defaults
nnoremap d "_d
vnoremap d "_d

nnoremap <C-m> m
nnoremap <C-,> ,
nnoremap <C-.> .
nnoremap <C-_> /

nnoremap m <Left>
nnoremap , <Down>
nnoremap . <Up>
nnoremap / <Right>

nnoremap <leader>qq <S-m>
nnoremap <leader>qw <
nnoremap <leader>qf >
nnoremap <leader>qp ? 

nnoremap <S-m> <S-Left>
nnoremap < <S-Down>
nnoremap > <S-Up>
nnoremap ? <S-Right>

nnoremap <C-m> m
nnoremap <C-,> ,
nnoremap <C-.> .
nnoremap <C-_> /

vnoremap m <Left>
vnoremap , <Down>
vnoremap . <Up>
vnoremap / <Right>

vnoremap <leader>qq <S-m>
vnoremap <leader>qw <
vnoremap <leader>qf >
vnoremap <leader>qp ? 

vnoremap <S-m> <S-Left>
vnoremap < <S-Down>
vnoremap > <S-Up>
vnoremap ? <S-Right>

" ----------------
" CUSTOM FUNCTIONS
" ----------------

function! ReturnHighlightTerm(group, term)
   " Store output of group to variable
   let output = execute('hi ' . a:group)

   " Find the term we're looking for
   return matchstr(output, a:term.'=\zs\S*')
endfunction

" Toggle Themes and Reset Source Bind
function! SwitchThemes()
	if g:colors_name=="onehalfdark"
		colorscheme ayu
		set termguicolors
	elseif g:colors_name=="ayu"
		colorscheme quantum
		set termguicolors
	elseif g:colors_name=="quantum"
		colorscheme nord
		set termguicolors
	elseif g:colors_name=="nord"
		colorscheme tokyonight
		set termguicolors
	elseif g:colors_name=="tokyonight"
		colorscheme moonlight
        set termguicolors
	elseif g:colors_name=="moonlight"
		colorscheme onehalfdark 
		set termguicolors
	endif

    call plug#load('lualine.nvim')
    lua dofile("/home/booperlv/.config/nvim/lua/statusline.lua")
    lua dofile("/home/booperlv/.config/nvim/lua/top-bufferline.lua")

    echo 'changed colorscheme, unset variables, reloaded lualine'

    return
endfunction

nnoremap <leader>ct :call SwitchThemes()<CR>

"function! DeleteBGColor()
"	hi Normal guibg=NONE
"	hi TabLine guibg=NONE
"	hi TabLineFill guibg=NONE
"	hi TabLineSel guibg=NONE
"	hi LineNr guibg=NONE
"	set termguicolors
"endfunction
"nnoremap <leader>cc :call DeleteBGColor()<CR>

" -----------
" LUA SECTION
" -----------

lua require('config')
