" --------------
" PLUGIN SECTION
" --------------

" Vim-plug
call plug#begin("~/.config/nvim/plugged")

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Colors
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'Shatur/neovim-ayu'
Plug 'folke/tokyonight.nvim'
" TODO:: FORK THIS JUST TO FIX THE DAMNED STATUSLINE AND TABLINE
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'folke/lsp-colors.nvim'
" Colorizer for hex codes
Plug 'norcalli/nvim-colorizer.lua'

" Language Servers
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

" UI changes
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'camspiers/snap'

" Code-manipulation/navigation helpers :)
" !!! very nice
Plug 'ggandor/lightspeed.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'b3nj5m1n/kommentary'
Plug 'preservim/tagbar'

" Nice things to have
Plug 'folke/which-key.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'folke/trouble.nvim'
Plug 'folke/zen-mode.nvim'
Plug 'booperlv/cyclecolo.lua'

" Game :D
Plug 'alec-gibson/nvim-tetris'

" Development
" Plug '~/Projects/neovimplugins/cyclecolo.lua'
Plug '~/Projects/neovimplugins/gomove.nvim'

call plug#end()

" --------------
" CONFIG SECTION
" --------------

" Colorscheme
set termguicolors
let g:ayu_mirage=v:true
let g:material_borders = v:true
let background="dark"
let g:seoul256_borders = v:true
colorscheme tokyonight

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
set shiftwidth=2 tabstop=2
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
"set cursorline

" Set Key Timeout
set timeoutlen=500
"set notimeout

" Remap Esc -command switch to normal
inoremap nz n
inoremap nn <esc>
inoremap nx nn

" Map Leader to space
nnoremap <SPACE> <NOP>
let mapleader=" "

" -------------------------------------
" PLUGIN CONFIG AND KEYBINDINGS SECTION
" -------------------------------------

" IndentLine and Indent-blankline
let g:indentLine_enabled = 1
let g:indent_blankline_char = "▏"
let g:indent_blankline_show_first_indent_level = v:false
" let g:indent_blankline_show_trailing_blankline_indent = v:false

" Cycle Colorscheme
nnoremap <leader>ct :ColoToggle<CR>

" emmet vim
let g:user_emmet_leader_key='<C-Z>'
nnoremap <leader>em :call feedkeys("<C-Z>,")<CR>

" gomove mappings
xmap <A-m> <Plug>VisualMoveLeft
xmap <A-,> <Plug>VisualMoveDown
xmap <A-.> <Plug>VisualMoveUp
xmap <A-/> <Plug>VisualMoveRight
nmap <A-m> <Plug>NormalMoveLeft
nmap <A-,> <Plug>NormalMoveDown
nmap <A-.> <Plug>NormalMoveUp
nmap <A-/> <Plug>NormalMoveRight

nmap <A-d> <Plug>MoveDuplicateMode
xmap <A-d> <Plug>MoveDuplicateMode


" nvim bufferline
nnoremap <silent><leader>/ :BufferLineCycleNext<CR>
nnoremap <silent><leader>m :BufferLineCyclePrev<CR>
" These commands will move the current buffer backwards or forwards in the bufferline
nnoremap <silent><leader>? :BufferLineMoveNext<CR>
nnoremap <silent><leader>M :BufferLineMovePrev<CR>
" Close buffer
nnoremap <silent><leader>q :bwipeout<CR>

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
let g:nvim_tree_width = '30%' "30 by default
let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_show_icons = {
            \ 'git': 1,
            \ 'folders': 1,
            \ 'files': 1,
            \ }
" Remove the statusline on the tree
au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == 'NvimTree' | set laststatus=0 | else | set laststatus=2 | endif

" TagBar
nnoremap <leader>tb :TagbarToggle<CR>

" Telescope.nvim
" nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
" nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
" nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" overwrite defaults
nnoremap <leader>y "+y 
xnoremap <leader>y "+y 
nnoremap <leader>p "+p 
xnoremap <leader>p "+p 
nnoremap <leader>d "_d
xnoremap <leader>d "_d

" Arrow Keys
nnoremap <C-m> m
nnoremap <C-,> ,
nnoremap <C-.> .
nnoremap <C-_> /

nnoremap m <Left>
nnoremap , <Down>
nnoremap . <Up>
nnoremap / <Right>

nnoremap <S-m> M
nnoremap <S-,> <
nnoremap <S-.> >
nnoremap <S-/> ?

xnoremap <C-m> m
xnoremap <C-,> ,
xnoremap <C-.> .
xnoremap <C-_> /

xnoremap m <Left>
xnoremap , <Down>
xnoremap . <Up>
xnoremap / <Right>

" Splits
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

nnoremap <leader>w <C-w>

" Source vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>

" ----------------
" CUSTOM FUNCTIONS
" ----------------

function! ReturnHighlightTerm(group, term)
    let output = execute('hi ' . a:group)
    return matchstr(output, a:term.'=\zs\S*')
endfunction

function! ShowWhitespace(flags)
    let bad = ''
    let pat = []
    for c in split(a:flags, '\zs')
        if c == 'e'
            call add(pat, '\s\+$')
        elseif c == 'i'
            call add(pat, '^\t*\zs \+')
        elseif c == 's'
            call add(pat, ' \+\ze\t')
        elseif c == 't'
            call add(pat, '[^\t]\zs\t\+')
        else
            let bad .= c
        endif
    endfor
    if len(pat) > 0
        let s = join(pat, '\|')
        exec 'syntax match ExtraWhitespace "'.s.'" containedin=ALL'
    else
        syntax clear ExtraWhitespace
    endif
    if len(bad) > 0
        echo 'ShowWhitespace ignored: '.bad
    endif
endfunction

function! ToggleShowWhitespace()
    if !exists('b:ws_show')
        let b:ws_show = 0
    endif
    if !exists('b:ws_flags')
        let b:ws_flags = 'est'  " default (which whitespace to show)
    endif
    let b:ws_show = !b:ws_show
    if b:ws_show
        call ShowWhitespace(b:ws_flags)
    else
        call ShowWhitespace('')
    endif
endfunction

nnoremap <Leader>ws :call ToggleShowWhitespace()<CR>
highlight ExtraWhitespace ctermbg=white guibg=white

" -----------
" LUA SECTION
" -----------

lua require('config')
