" Vundle plugins
" Inside VIM run :PluginInstall
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle'


" Enable folding
" :help fold-commands
set foldmethod=indent
set foldlevel=99
" Enable folding with spacebar
nnoremap <space> za
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'  " Pyhton Indent
Plugin 'tpope/vim-fugitive'   " Git
Plugin 'scrooloose/nerdtree'  " File browsing
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/syntastic' " Syntax highlighting
Plugin 'nvie/vim-flake8'      " Syntax checking
Plugin 'jnurmine/Zenburn'     " Color Scheme
Plugin 'altercation/vim-colors-solarized'
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}  " Powerline
Plugin 'bling/vim-airline'    " Airline
call vundle#end()


syntax enable
set background=dark
"colorscheme solarized
"let g:solarized_termcolors=256
colorscheme zenburn


filetype plugin indent on  " enables filetype detection
let mapleader=","
set nu
let python_highlight_all=1
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/  " Flag unnecessary whitespace
set encoding=utf-8 " UTF-8 support
set clipboard=unnamed  " System clipboard
let NERDTreeIgnore=['\.pyc$', '\~$']

let g:SimpylFold_docstring_preview = 1  " SimplyFold plugin
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

set laststatus=2  " show Airline
let g:airline_powerline_fonts = 1


au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
au BufNewFile,BufRead *.js, *.html, *.css, *.xml
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" ==== NerdTree ====
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

