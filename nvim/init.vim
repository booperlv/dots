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

" Multiple Cursors
Plug 'terryma/vim-multiple-cursors'

" Vim Surround
Plug 'tpope/vim-surround'

" Indent Guides
Plug 'lukas-reineke/indent-blankline.nvim', { 'branch': 'lua' }

call plug#end()

" --------------
" CONFIG SECTION
" --------------

" Colorscheme
let ayucolor="dark"
let background="dark"
colorscheme quantum
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
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4

" ---------------------
" PLUGIN CONFIG SECTION
" ---------------------

" emmet vim
let g:user_emmet_leader_key='<C-Z>'

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
nnoremap <silent>    <A-q> :BufferClose<CR>
let bufferline = get(g:, 'bufferline', {})
let bufferline.animation = v:false
let bufferline.closable = v:false
let bufferline.icon_separator_active = '-> '
let bufferline.icon_separator_inactive = '<-'
let bufferline.icon_close_tab = ''
let bufferline.icon_close_tab_modified = '●'

" pear-tree
let g:pear_tree_smart_openers = 0
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1
let g:pear_tree_ft_disabled = [ "TelescopePrompt" ]

" completion-nvim
set completeopt=menuone,noinsert,noselect

" Nvim Tree
nnoremap <C-b> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
let g:nvim_tree_quit_on_open = 1

" -------------------
" KEYBINDINGS SECTION
" -------------------

" completion-nvim Bindings
inoremap <nowait>  <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <nowait>  <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" overwrite defaults
nnoremap dd "_dd
nnoremap <C-m> m
nnoremap <C-,> ,
nnoremap <C-.> .
nnoremap <C-_> /

nnoremap m h
nnoremap , j
nnoremap . k
nnoremap / l

vnoremap <C-m> m
vnoremap <C-,> ,
vnoremap <C-.> .
vnoremap <C-_> /

vnoremap m h
vnoremap , j
vnoremap . k
vnoremap / l

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
