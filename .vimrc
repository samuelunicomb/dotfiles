" VIM Configuration File
" Description: Optimized for C/C++ development, but useful also for other things.

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" disable vi compatibility (emulation of old bugs)
set nocompatible

" use indentation of previous line
set autoindent

" use intelligent indentation for C
"set smartindent

" configure tabwidth and insert spaces instead of tabs
set tabstop=2        " tab width is 2 spaces
set shiftwidth=2     " indent also with 2 spaces
set expandtab        " expand tabs to spaces
retab

" line numbering
set number
set numberwidth=2

" shows cursor information 
set ruler

" turn syntax highlighting on
syntax on
colorscheme industry

" turn line numbers on
set number

" highlight matching braces
set showmatch

" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" highlight searched terms
set hlsearch

" undo highlighting after hitting enter
nnoremap <CR> :noh<CR><CR>

" wrap lines at 120 chars. 80 is somewhat antiquated with modern displays.
set textwidth=80
set nowrap
set textwidth=0 wrapmargin=0

nmap <C-N><C-N> :set invnumber<CR>

" auotomatically save folds, and implement folds on opening a file
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" statusline configuration
"set laststatus=2
"
"set statusline=
"set statusline+=%#PmenuSel#
""set statusline+=%#LineNr#
"set statusline+=\ %F
"set statusline+=%m\
"set statusline+=%=
"" set statusline+=%#CursorColumn#
"set statusline+=\ %y
"set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
"set statusline+=\[%{&fileformat}\]
"set statusline+=\ %l(%L),%c
"set statusline+=\
