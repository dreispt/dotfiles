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

" Add Pyhton debug breakpoint
nnoremap <c-space> A<CR>import pudb; pu.db<ESC>

nnoremap <C-e> :Ex<cr>
nnoremap <C-l> :ls<cr>
nnoremap <C-n> :bp<cr>
nnoremap <C-m> :bn<cr>
nnoremap <C-x> :bd<cr>

" C-s to Save
nnoremap <C-s> :w<cr>
inoremap <C-s> <ESC>:w<cr>

" WSL Copy-Paste
" copy (write) highlighted text to .vimbuffer
vmap <C-c><C-c> y:new ~/.vimbuffer<CR>VGp:x<CR> \| :!cat ~/.vimbuffer \| clip.exe <CR><CR>
" paste from buffer
map <C-v><C-v> :r ~/.vimbuffer<CR>

" remove trailing space
" autocmd BufWritePre *.py :%s/\s\+$//e
