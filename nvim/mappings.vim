if exists('b:mappings_loaded')
  finish
endif
""let b:mappings_loaded = 1

nnoremap Q <nop>
inoremap <c-c> <esc>
nnoremap <space> za

map j gj
map k gk

nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j

nnoremap <c-e><c-e> :vs $MYVIMRC<cr>
nnoremap <leader>f zMzvzz
tnoremap <esc> <c-\><c-n>

nnoremap <C-e> :Ex<cr>
nnoremap <C-n> :bp<cr>
nnoremap <C-m> :bn<cr>
nnoremap <C-x> :bd<cr>
