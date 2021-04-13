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
Plug 'dylanaraps/wal.vim'
" Css Colorizer
Plug 'norcalli/nvim-colorizer.lua'

" Language Servers
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

" StatusLine
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" TabLine
Plug 'romgrk/barbar.nvim'

" Neovim Tree
Plug 'kyazdani42/nvim-tree.lua'

call plug#end()

" --------------
" CONFIG SECTION
" --------------

" Colorscheme
set termguicolors
set cursorline
let ayucolor="dark"
let background="dark"
colorscheme ayu

" Plugin Global
filetype plugin indent on
syntax enable

" Encoding
set encoding=UTF-8

" Clipboard
set clipboard=unnamedplus

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

" completion-nvim
set completeopt=menuone,noinsert,noselect

" -------------------
" KEYBINDINGS SECTION
" -------------------

" Barbar Tabline Bindings
nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>
nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
nnoremap <silent>    <A->> :BufferMoveNext<CR>
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>
nnoremap <silent>    <A-c> :BufferClose<CR>
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>

" completion-nvim Bindings
inoremap <nowait>  <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <nowait>  <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Nvim Tree Bindings
nnoremap <silent><C-b> :NvimTreeToggle<CR>
nnoremap <silent><leader>r :NvimTreeRefresh<CR>

" Toggle Themes and Reset Source Bind
function! SwitchThemes()
	if g:colors_name=="onehalfdark"
		colorscheme ayu
		return
	elseif g:colors_name=="ayu"
		colorscheme quantum
		return
	elseif g:colors_name=="quantum"
		colorscheme nord
		return
	elseif g:colors_name=="nord"
		colorscheme wal
		return
	elseif g:colors_name=="wal"
		colorscheme onehalfdark
		highlight EndOfBuffer ctermfg=bg guifg=bg
		return
	endif
endfunction

nnoremap <leader>m :call SwitchThemes()<CR>

" -----------
" LUA SECTION
" -----------

" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()
lua require('config') 
