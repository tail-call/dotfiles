" I don't really want a mouse anymore
" set mouse=a

syntax enable

set noswapfile

set wrap

set nolinebreak
set showbreak=ø
set wildmenu

set ruler

set autoindent

set expandtab ts=4 sw=4 ai

nn ` :set hlsearch!<CR>
" ^J - move rest of line to a new line (like in evil)
"nn <C-j> o<Esc>k
"nn <C-k> O<Esc>j
nn <C-j> i<CR><Esc>
