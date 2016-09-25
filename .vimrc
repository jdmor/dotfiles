set listchars+=space:␣,eol:¬,tab:>.
set list

" show existing tab with 2 spaces width
set tabstop=2

" when indenting with '>', use 2 space width
set shiftwidth=2

" Highlight search text
set hls

" Treat all numbers as decimal, regardless if there are leading zeros
set nrformats=

" Show line numbers
set number

" Use junegunn/vim-plug to manage vim packages
call plug#begin()
Plug 'tpope/vim-sensible'

" Display directory in sidebar
Plug 'scrooloose/nerdtree'

" Full path fuzzy file, buffer, mru, tag ... finder for Vim
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'

" Auto update tags
" Make sure ctags is installed
Plug 'ludovicchabant/vim-gutentags'

" Display file's current tags in sidebar
Plug 'majutsushi/tagbar'

" Search tool
Plug 'mileszs/ack.vim'

" Status toolbar
" dependency: powerline font to properly display symbols
Plug 'vim-airline/vim-airline'
call plug#end()

" Remove trailing whitespace before saving a file
autocmd BufWritePre * %s/\s\+$//e

" Use ag for Ack
" dependency: the_silver_searcher / ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Key mapping
let mapleader = ","
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <leader>p :CtrlPFunky<CR>
nnoremap <leader>k :NERDTree<CR>

" Configure airline status bar
let g:airline_powerline_fonts = 1

" Set colors
highlight nonText ctermfg=240
highlight SpecialKey ctermfg=240
highlight Comment ctermfg=245
highlight LineNr ctermfg=245
