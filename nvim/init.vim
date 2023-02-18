" config variables
if has('win32') || has('win64')
  let g:plugged_home = '~/AppData/Local/nvim/plugged'
else
  let g:plugged_home = '~/.vim/plugged'
endif


" Plugins List
call plug#begin(g:plugged_home)
  " UI related
  Plug 'chriskempson/base16-vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " Git status gutter indicators
  Plug 'airblade/vim-gitgutter'
  " Better Visual Guide
  Plug 'Yggdroot/indentLine'
  " syntax check
  Plug 'dense-analysis/ale'
  " Formater
  ""Plug 'Chiel92/vim-autoformat'
  Plug 'averms/black-nvim', {'do': 'UpdateRemotePlugins'}
  " Vim
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'f-person/git-blame.nvim'

  " Autocomplete
  Plug 'ncm2/ncm2'  " nvim-completion-manager
  Plug 'roxma/nvim-yarp'  " ncm2 dependency
  Plug 'ncm2/ncm2-bufword'
  Plug 'fgrsnau/ncm2-otherbuf'
  Plug 'ncm2/ncm2-path'
  Plug 'ncm2/ncm2-jedi'

call plug#end()

" settings & mappings
runtime settings.vim
runtime mappings.vim


" colorscheme
let base16colorspace=256
colorscheme base16-monokai


" vim-autoformat
""noremap <F3> :Autoformat<CR>

" Black
let g:black_linelength = 88

" NCM2
"if exists('ncm2#enable_for_buffer')
  augroup NCM2
    autocmd!
    " enable ncm2 for all buffers
    autocmd BufEnter * call ncm2#enable_for_buffer()
    " :help Ncm2PopupOpen for more information
    set completeopt=noinsert,menuone,noselect

    " When the <Enter> key is pressed while the popup menu is visible, it only
    " hides the menu. Use this mapping to close the menu and also start a new
    " line.
    inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

    " Use <TAB> to select the popup menu:
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

    ""  " When the <Enter> key is pressed while the popup menu is visible, it only
    ""  " hides the menu. Use this mapping to close the menu and also start a new line.
    ""  inoremap <expr> <CR> (pumvisible() ? "\<c-y>" : "\<CR>")
    ""  ""inoremap <expr> <CR> (pumvisible() && !empty(v:completed_item) ? "\<c-y>" : (pumvisible() ? "\<c-y>\<cr>" : "\<CR>"))
  augroup END
"else
"    echo "NCM2 is disabled!"
"endif


" Ale
let g:ale_lint_on_enter = 1
let ale_lint_on_insert_leave = 1
"let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {
    \ 'python': ['flake8', 'pylint', 'pylint-odoo'],
    \ 'javascript': ['eslint'],
    \ }
" Airline
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'
let g:airline_theme='simple'

" Persistent undo
if has('persistent_undo')
    call system('mkdir -p ~/.config/nvim-undo')
    set undodir=~/.config/nvim-undo
    set undofile
endif

" More frequent updates, for vim-gutter
set updatetime=1000
