set listchars+=space:␣,eol:¬,tab:>.
set list

" show existing tab with 2 spaces width
set tabstop=2

" when indenting with '>', use 2 space width
set shiftwidth=2

" On pressing tab, insert 2 spaces
set expandtab

" Create new highlight group for whitespace
" Match space and eol characters
highlight Whitespace ctermfg=8
match Whitespace /\n\|\s/

" Highlight search text
set hls

" Treat all numbers as decimal, regardless if there are leading zeros
set nrformats=

" Show line numbers
set number

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'craigemery/vim-autotag'
call plug#end()
