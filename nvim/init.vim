if exists('g:vscode')
else




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
Plug 'dylanaraps/wal.vim'
" Css Colorizer
Plug 'norcalli/nvim-colorizer.lua'

" Language Servers
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

" StatusLine
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Auto Closer
Plug 'tmsvg/pear-tree'

" TabLine
Plug 'romgrk/barbar.nvim'

" Neovim Tree
Plug 'kyazdani42/nvim-tree.lua'

call plug#end()

" --------------
" CONFIG SECTION
" --------------

" Colorscheme
let ayucolor="dark"
let background="dark"
colorscheme ayu
set termguicolors

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
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4

" ---------------------
" PLUGIN CONFIG SECTION
" ---------------------

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

" pear-tree
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

" completion-nvim
set completeopt=menuone,noinsert,noselect

" -------------------
" KEYBINDINGS SECTION
" -------------------

" completion-nvim Bindings
inoremap <nowait>  <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <nowait>  <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Nvim Tree Bindings
nnoremap <silent><C-b> :NvimTreeToggle<CR>
nnoremap <silent><leader>r :NvimTreeRefresh<CR>

" overwrite defaults
nnoremap dd "_dd

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

nnoremap <leader>m :call SwitchThemes()<CR>

function! DeleteBGColor()
	hi Normal guibg=NONE
	hi TabLine guibg=NONE
	hi TabLineFill guibg=NONE
	hi TabLineSel guibg=NONE
	hi LineNr guibg=NONE
	set termguicolors
endfunction
nnoremap <leader>, :call DeleteBGColor()<CR>





endif
