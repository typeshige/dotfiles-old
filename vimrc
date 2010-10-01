set nocompatible
set noexrc " don't use local version of .(g)vimrc, etc
set number
syntax on
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

filetype plugin indent on " load filetype plugins/indent settings
set autochdir
set backspace=indent,eol,start " make backspace more flexible?
set mouse=a " use mouse everywhere

"Vim UI {
    set cursorcolumn " highlight the current column
    set cursorline " highlight the current line
    set list " show tabs
    set listchars=tab:>-,trail:- " show tabs and trailing
    set ruler
    " set scrolloff=10 " keep 10 lines top/bottom for scope
    set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
    "              | | | | |  |   |      |  |     |    |
    "              | | | | |  |   |      |  |     |    + current
    "              | | | | |  |   |      |  |     |       column
    "              | | | | |  |   |      |  |     +-- current line
    "              | | | | |  |   |      |  +-- current % into file
    "              | | | | |  |   |      +-- current syntax in
    "              | | | | |  |   |          square brackets
    "              | | | | |  |   +-- current fileformat
    "              | | | | |  +-- number of lines
    "              | | | | +-- preview flag in square brackets
    "              | | | +-- help flag in square brackets
    "              | | +-- readonly flag in square brackets
    "              | +-- rodified flag in square brackets
    "              +-- full path to file in the buffer
" }

" Text Formatting/Layout {
    set expandtab
    set formatoptions=rq " insert comment leader on return, let gq format
    set ignorecase
    set infercase " case inferred
    set shiftround
    set smartcase " if caps, go case-sensitive
    set shiftwidth=4 " auto-indent amount when using cindent
    set softtabstop=4 " when tab or bs, how many spaces
    set tabstop=4
    set autoindent
    set smarttab
" }

set nobackup
set nowritebackup
set noswapfile

set guioptions-=T

" CODE NAVIGATION

" Taglist variables
" Display function name in status bar:
let g:ctags_statusline=1
" Automatically start script
let generate_tags=1
" Displays taglist results in a vertical window:
let Tlist_Use_Horiz_Window=0
" Shorter commands to toggle Taglist display
"
" Mappings {
    " ROT13 - fun
    map <F12> ggVGg?
    nnoremap TT :TlistToggle<CR>
    noremap <S-space> <C-b>
    noremap <space> <C-f>
    map <F4> :TlistToggle<CR>
    map <F7> :NERDTreeToggle<CR>

" }
" Various Taglist diplay config:
let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_File_Fold_Auto_Close = 1

" PYDICTION
"
let g:pydiction_location='~/vim/vimfiles/ftplugin/pydiction/complete-dict'
let g:pydiction_menu_height = 20

" COLORS
"
"set background=dark
colorscheme ir_black
"let xterm16_brightness='default'
"let xterm16_colormap='allblue'
"colo xterm16

autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd FileType python compiler pylint

"the quickfix window is not always 10 lines height
au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
    exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

"quickfix toogle
command! -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    let g:pylint_cwindow = 0
    unlet g:qfix_win
  else
    copen 10
    call AdjustWindowHeight(3, 10)
    let g:pylint_cwindow = 1
    let g:qfix_win = bufnr("$")
  endif
endfunction



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Trim trailing whitespace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType python autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"highlight columns over 80
"from http://vim.wikia.com/wiki/Highlight_long_lines
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)


" GUI Settings {
if has("gui_running")
    " Basics {
        colorscheme shige-wombat256
        set columns=180
        set guifont=Inconsolata\ Medium\ 12
        set guioptions=ce
    " }
endif
" }

filetype indent on
filetype on
filetype plugin on
