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
Plug 'owozsh/amora'
Plug 'folke/tokyonight.nvim'
Plug 'shaunsingh/moonlight.nvim'
" Css Colorizer
Plug 'norcalli/nvim-colorizer.lua'

" Language Servers
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

" Auto Closer
Plug 'tmsvg/pear-tree'

" TabLine
Plug 'romgrk/barbar.nvim'
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
"Plug 'Yggdroot/indentLine'

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

"Alternative to indent guides since it can be a bit of a hassle sometimes
"set cursorcolumn
set cursorline

" Set Key Timeout
set ttimeoutlen=0
set notimeout

" Remap Esc -command switch to normal
inoremap z/ <esc>
inoremap /z <esc>

" Map Leader to space
nnoremap <SPACE> <NOP>
let mapleader=" "

" -------------------------------------
" PLUGIN CONFIG AND KEYBINDINGS SECTION
" -------------------------------------

" IndentLine and Indent-blankline
let g:indentLine_char = '▏'

" vim-indentline
"let g:indentguides_spacechar = '▏'
"let g:indentguides_tabchar = '▏'

" emmet vim
let g:user_emmet_leader_key='<C-Z>'
nnoremap <leader>em :call feedkeys("<C-Z>,")<CR>

" barbar.nvim
" Move to previous/next
nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
nnoremap <silent>    <A->> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>
" Close buffer
nnoremap <silent>    <A-w> :BufferClose<CR>
let bufferline = get(g:, 'bufferline', {})
let bufferline.animation = v:false
let bufferline.closable = v:false
let bufferline.icon_separator_active = ''
let bufferline.icon_separator_inactive = ''
let bufferline.icon_close_tab = ''
let bufferline.icon_close_tab_modified = '●'

" pear-tree
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1
let g:pear_tree_ft_disabled = [ "TelescopePrompt" ]

" completion-nvim
set completeopt=menuone,noinsert,noselect

" Nvim Tree
nnoremap <leader>tt :NvimTreeToggle<CR>
nnoremap <leader>tr :NvimTreeRefresh<CR>
nnoremap <leader>tf :NvimTreeFindFile<CR>
let g:nvim_tree_width = 40 "30 by default
let g:nvim_tree_auto_open = 1 "0 by default, opens the tree when typing `vim $DIR` or `vim`
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
let g:nvim_tree_icons = {
      \ 'default': '',
      \ 'folder': {'default': '', 'open': '', 'empty': '', 'empty_open': ''},
      \}
let g:nvim_tree_quit_on_open = 1

" completion-nvim Bindings
inoremap <nowait>  <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <nowait>  <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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

" Telescope.nvim
" Using lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" -----------
" LUA SECTION
" -----------

" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()
lua require('config')

" ----------------
" CUSTOM FUNCTIONS
" ----------------

" Toggle Themes and Reset Source Bind
function! SwitchThemes()
	if g:colors_name=="onehalfdark"
		colorscheme ayu
		set termguicolors
		return
	elseif g:colors_name=="ayu"
		colorscheme quantum
		set termguicolors
		return
	elseif g:colors_name=="quantum"
		colorscheme nord
		set termguicolors
		return
	elseif g:colors_name=="nord"
		colorscheme amora 
		set termguicolors
		hi Normal guibg=#2A2331
		return
	elseif g:colors_name=="amora"
		colorscheme tokyonight
		set termguicolors
		return
	elseif g:colors_name=="tokyonight"
		lua require('material').set()	
		set termguicolors
		return
	elseif g:colors_name=="material"
		colorscheme default
		set termguicolors!
		return
	elseif g:colors_name=="default"
		colorscheme onehalfdark
		set termguicolors
		highlight EndOfBuffer ctermfg=bg guifg=bg
		return
	endif
endfunction

nnoremap <leader>ct :call SwitchThemes()<CR>

function! DeleteBGColor()
	hi Normal guibg=NONE
	hi TabLine guibg=NONE
	hi TabLineFill guibg=NONE
	hi TabLineSel guibg=NONE
	hi LineNr guibg=NONE
	set termguicolors
endfunction
nnoremap <leader>cc :call DeleteBGColor()<CR>
