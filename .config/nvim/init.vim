" --------------
" PLUGIN SECTION
" --------------

" Vim-plug
call plug#begin("~/.config/nvim/plugged")

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Colors
Plug 'ayu-theme/ayu-vim'
Plug 'booperlv/miramare'
Plug 'folke/tokyonight.nvim'
Plug 'shaunsingh/seoul256.nvim'
" Colors for LSP even when the colorscheme doesn't support it
Plug 'folke/lsp-colors.nvim'
" Css Colorizer
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }

" Language Servers
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

" Snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'


" TabLine
Plug 'akinsho/nvim-bufferline.lua'
" Status Line
Plug 'hoob3rt/lualine.nvim'

" Icons
Plug 'kyazdani42/nvim-web-devicons'

" File Explorer
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" File Tree
Plug 'kyazdani42/nvim-tree.lua'

" Auto Closer
" Plug 'tmsvg/pear-tree'
Plug 'windwp/nvim-autopairs'
" Emmet
Plug 'mattn/emmet-vim'
" Vim Surround
Plug 'tpope/vim-surround'
" Vim Move
Plug 'matze/vim-move'

" Indent Guides
Plug 'lukas-reineke/indent-blankline.nvim', { 'branch': 'lua' }
" Pretty LSP Errors and Things indicator
Plug 'folke/trouble.nvim'
" Zen Mode, focus :D
Plug 'folke/zen-mode.nvim'
" Color Picker
Plug 'DougBeney/pickachu'

call plug#end()

" --------------
" CONFIG SECTION
" --------------

" Colorscheme
let ayucolor="mirage"
let background="dark"
set termguicolors
let g:seoul256_borders = v:true
colorscheme miramare 

" Set Font for GUI
set guifont=Iosevka:h11

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
set timeoutlen=500
"set notimeout

" Remap Esc -command switch to normal
inoremap nn <esc>
inoremap nz nn

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

" CSS Colorizer (vim-hexokinase)
let g:Hexokinase_highlighters = ['virtual']

" Color Picker
nnoremap <leader>cp :Pick<CR>

" emmet vim
let g:user_emmet_leader_key='<C-Z>'
nnoremap <leader>em :call feedkeys("<C-Z>,")<CR>

" vim-move mappings
let g:move_map_keys = 0
xmap <A-m> <Plug>MoveBlockLeft
xmap <A-,> <Plug>MoveBlockDown
xmap <A-.> <Plug>MoveBlockUp
xmap <A-/> <Plug>MoveBlockRight
nmap <A-m> <Plug>MoveCharLeft
nmap <A-,> <Plug>MoveLineDown
nmap <A-.> <Plug>MoveLineUp
nmap <A-/> <Plug>MoveCharRight

" nvim bufferline
nnoremap <silent><leader>/ :BufferLineCycleNext<CR>
nnoremap <silent><leader>m :BufferLineCyclePrev<CR>
" These commands will move the current buffer backwards or forwards in the bufferline
nnoremap <silent><leader>? :BufferLineMoveNext<CR>
nnoremap <silent><leader>M :BufferLineMovePrev<CR>
" Close buffer
nnoremap <silent><leader>q :bdelete<CR>

" nvim-compe
set completeopt=menuone,noselect
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" lsp trouble mapping
nnoremap <leader>xx :TroubleToggle<cr>
nnoremap <leader>xw :TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>xd :TroubleToggle lsp_document_diagnostics<cr>
nnoremap <leader>xq :TroubleToggle quickfix<cr>
nnoremap <leader>xl :TroubleToggle loclist<cr>

" zen-mode mapping
nnoremap <leader>zm :ZenMode<cr>

" Nvim Tree
nnoremap <leader>tt :NvimTreeToggle<CR>
nnoremap <leader>tr :NvimTreeRefresh<CR>
nnoremap <leader>tf :NvimTreeFindFile<CR>
let g:nvim_tree_side = 'left' "left by default
let g:nvim_tree_width = 25 "30 by default
let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
let g:nvim_tree_auto_open = 1 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_width_allow_resize  = 1 "0 by default, will not resize the tree when opening a file
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ }

" Telescope.nvim
" Using lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" overwrite defaults
nnoremap <leader>y "+y 
xnoremap <leader>y "+y 
nnoremap <leader>p "+p 
xnoremap <leader>p "+p 
nnoremap <leader>d "_d
xnoremap <leader>d "_d

nnoremap <C-m> m
nnoremap <C-,> ,
nnoremap <C-.> .
nnoremap <C-_> /

nnoremap m <Left>
nnoremap , <Down>
nnoremap . <Up>
nnoremap / <Right>

nnoremap <C-S-m> <S-m>
nnoremap <C-S-,> <S-,>
nnoremap <C-S-.> <S-.>
nnoremap <C-S-/> <S-/> 

nnoremap <S-m> <S-Left>
nnoremap <S-,> <S-Down>
nnoremap <S-.> <S-Up>
nnoremap <S-/> <S-Right>

xnoremap <C-m> m
xnoremap <C-,> ,
xnoremap <C-.> .
xnoremap <C-_> /

xnoremap m <Left>
xnoremap , <Down>
xnoremap . <Up>
xnoremap / <Right>

xnoremap <C-S-m> <S-m>
xnoremap <C-S-,> <S-,>
xnoremap <C-S-.> <S-.>
xnoremap <C-S-/> <S-/> 

xnoremap <S-m> <S-Left>
xnoremap <S-,> <S-Down>
xnoremap <S-.> <S-Up>
xnoremap <S-/> <S-Right>

" Splits
" Arrow Keys
nnoremap <leader>wm :wincmd h<CR>
nnoremap <leader>w, :wincmd j<CR>
nnoremap <leader>w. :wincmd k<CR>
nnoremap <leader>w/ :wincmd l<CR>
nnoremap <leader>wM :wincmd H<CR>
nnoremap <leader>w< :wincmd J<CR>
nnoremap <leader>w> :wincmd K<CR>
nnoremap <leader>w? :wincmd L<CR>
" Move focus between
nnoremap <leader>ww :wincmd w<CR>
"Split Management
" window vertical, window horizontal, window resize vertical etc
nnoremap <leader>wv :vsplit<CR>
nnoremap <leader>wh :split<CR>
nnoremap <leader>wrv :vertical resize +3<CR>
nnoremap <leader>wrh :resize +3<CR>

nnoremap <leader>w <C-w>

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
    if g:colors_name=="seoul256"
        colorscheme ayu
        set termguicolors
	elseif g:colors_name=="ayu"
        colorscheme miramare
		set termguicolors
    elseif g:colors_name=="miramare"
        colorscheme tokyonight 
        set termguicolors
    elseif g:colors_name=="tokyonight"
        colorscheme seoul256
        set termguicolors
	endif

    call plug#load('lualine.nvim')
    lua dofile("/home/booperlv/.config/nvim/lua/statusline.lua")
    lua dofile("/home/booperlv/.config/nvim/lua/top-bufferline.lua")
    " echo 'changed colorscheme, unset variables, reloaded lualine'
    return
endfunction
nnoremap <leader>ct :call SwitchThemes()<CR>

" -----------
" LUA SECTION
" -----------

lua require('config')
