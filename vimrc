" Use Vim settings not Vi, must be first
set nocompatible

" Pathogen
call pathogen#infect()
call pathogen#helptags()

" General
set number                          " show line number
set backspace=indent,eol,start      " Allow backspacing over everything in insert mode
set history=1000                    " Lots of :cmdline history
set showcmd                         " Show incomplete cmds down the bottom
set showmode                        " Show current mode down the bottom
set visualbell                      " No sounds
set hidden
syntax on 

" Search Settings
set hlsearch
set incsearch
set ignorecase
set smartcase " if caps, go case-sensitive

" Turn Off Swap Files
set noswapfile
set nobackup
set nowritebackup

" Indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=4 
set softtabstop=4 
set tabstop=8
set expandtab

" Powerline
let g:Powerline_theme = "solarized256"
"let g:Powerline_colorscheme = "solarized256"
let g:Powerline_symbols = 'fancy'

filetype plugin indent on

" Display Tabs and Trailing Spaces
"set listchars=tab:▷⋅,trail:⋅,nbsp:
set listchars=tab:>-,trail:- " show tabs and trailing
"set listchars=tab:▸\ ,trail:·,eol:¬
"set listchars=tab:▸\ ,trail:·

set nowrap
set linebreak

" Folds
set foldmethod=indent
set foldlevel=99
set nofoldenable  "don't fold by default
set matchpairs+=<:>


" Completion
set wildmode=list:longest
set wildmenu
set wildignore+=.git,*.pyc
set wildignore+=*.png,*.jpg,*.gif

set formatoptions=rq " insert comment leader on return, let gq format
set infercase " case inferred
set shiftround
set textwidth=80

scriptencoding utf-8

set history=1000
set spell




set fileformats=unix,mac,dos

let mapleader = ','
imap jj <Esc>
set noexrc " don't use local version of .(g)vimrc, etc
set numberwidth=1
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

" Vertical and horizontal split then hop to a new buffer
:noremap <Leader>v :vsp^M^W^W<cr>
:noremap <Leader>h :split^M^W^W<cr>

set autochdir





" autocmd BufEnter * :syntax sync fromstart

set ai

set mouse=a " use mouse everywhere


"Vim UI
set cursorcolumn " highlight the current column
set cursorline " highlight the current line
set nostartofline
set list " show tabs

set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set scrolloff=5 " keep 10 lines top/bottom for scope
set sidescrolloff=7
set sidescroll=1
set laststatus=2
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%03v]%{fugitive#statusline()}
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


"Python
autocmd BufRead,BufNewFile *.py syntax on
autocmd BufRead,BufNewFile *.py set ai
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,with,try,except,finally,def,class



set title

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
    


:noremap <Leader>1 :set number!<CR>
:noremap <Leader>V :edit $MYVIMRC<CR>
:noremap <Leader>W :colorscheme wombat256<CR>
:noremap <Leader>a :NERDTree ~/.virtualenvs<CR>
:noremap <Leader>aa :NERDTree alphaapps<CR>
:noremap <Leader>ab :NERDTree abapps<CR>
:noremap <Leader>n :NERDTreeToggle<CR>
:noremap <Leader>p :NERDTree projects<CR>
:noremap <Leader>j :RopeGotoDefinition<CR>

map <Leader>b :LustyJuggler<CR>
let g:pymode_breakpoint_key = '<leader>B'
let g:pymode_folding = 0
"let g:pymode_lint_ignore = "E501"
let g:pymode_rope_goto_def_newwin = "new"
map <Leader>H :set hls!<CR>


" Text bubbling

:noremap <C-k> [e
:noremap <C-j> ]e
vmap <C-k> [egv
vmap <C-j> ]egv

" Visually select the text that was last edited/pasted
nmap gV `[v`]

command! -nargs=* W write <args>

" }
" Various Taglist diplay config:
let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_File_Fold_Auto_Close = 1

" PYDICTION
"
let g:pydiction_location='~/vimfiles/vim/bundle/pydiction/complete-dict'
let g:pydiction_menu_height = 20

" COLORS
"
set t_Co=256
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized

" Insert New Line *************************************************************
map <S-Enter> O<ESC> " awesome, inserts new line without going into insert mode
map <Enter> o<ESC>

autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(
autocmd FileType python set ft=python.django
autocmd FileType html set ft=htmldjango.html

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
"autocmd FileType python compiler pylint

autocmd bufwritepost .vimrc source $MYVIMRC

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

function TrimEndLines()
    let save_cursor = getpos(".")
    :silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Trim trailing whitespace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType python autocmd BufWritePre <buffer> :call TrimEndLines() | call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
autocmd FileType html autocmd BufWritePre <buffer> :call TrimEndLines() | call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"highlight columns over 79
"from http://vim.wikia.com/wiki/Highlight_long_lines
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists("+colorcolumn")
    set colorcolumn=79
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>79v.\+', -1)
endif


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
"

set grepprg=ack-grep

set completeopt=menuone,longest,preview
set pumheight=6

let NERDTreeIgnore = ['\.pyc$']
let NERDTreeMouseMode = 3

autocmd FileType python map <buffer> <leader>8 :call Pep8()<CR>
autocmd FileType python map <buffer> <leader>f :call Pyflakes()<CR>


"autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako setlocal noexpandtab shiftwidth=2 tabstop=2 softtabstop=2
"

map <leader>td <Plug>TaskList

map <leader>f :CommandT<CR>
"nmap <leader>A <Esc>:Ack!

map <leader>g :GundoToggle<CR>
map <leader>Rb :!kill -HUP `cat /tmp/astrobiology-beta.pid`<CR>
map <leader>Ra :!kill -HUP `cat /tmp/astrobiology-alpha.pid`<CR>
map <leader>Rn :!kill -HUP `cat /tmp/naiarss_gunicorn.pid`<CR>

nmap <leader>l <ESC>:TagbarToggle<cr>
imap <leader>l <ESC>:TagbarToggle<cr>i

"nmap <Left> <<
"nmap <Right> >>
"vmap <Left> <gv
"vmap <Right> >gv
"nmap <Up> [e
"nmap <Down> ]e
"vmap <Up> [egv
"vmap <Down> ]egv




au FileType python set omnifunc=pythoncomplete#Complete
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

"let g:pyflakes_use_quickfix = 0

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
