set listchars+=space:␣,eol:¬,tab:>.
set list

" --- Leader Shortcuts ---
let mapleader=","

" --- Spaces and Tabs ---
set tabstop=2    " number of visual spaces per TAB
set shiftwidth=2 " use 2 spaces when indenting with >>

" --- UI Config ---
set number     " show line numbers
set cursorline " highlight current line
set wildmenu   " visual autocomplete for commmand menu
set lazyredraw " redraw only when we need to
set showmatch  " highlight matching [{()}]

" --- Searching ---
set incsearch " search as characters are entered
set hlsearch  " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" --- Movement ---
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" highlight last inserted text
nnoremap gV `[v`]

" Treat all numbers as decimal, regardless if there are leading zeros
set nrformats=

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
" dependency: ack. Install via homebrew
Plug 'mileszs/ack.vim'

" Status toolbar
" dependency: powerline font to properly display symbols
Plug 'vim-airline/vim-airline'

" Git stuff
Plug 'tpope/vim-fugitive'
call plug#end()

" --- CtrlP settings ---
" show results from top to bottom
let g:ctrlp_match_window='bottom,order:ttb'
" use ag to search, which is much faster
let g:ctrlp_user_command='ag %s -l --nocolor -g ""'

" Remove trailing whitespace before saving a file
autocmd BufWritePre * %s/\s\+$//e

" Use ag for Ack
" dependency: the_silver_searcher / ag
if executable('ag')
  let g:ackprg='ag --vimgrep'
endif

" Key mapping
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
nnoremap <leader>p :CtrlPFunky<CR>

" Remap CtrlP commands
let g:ctrlp_prompt_mappings={'AcceptSelection("h")': ['<c-i>']}

" Remap NERDTree commands
nnoremap <leader>k :NERDTreeToggle<CR>

" Configure airline status bar
let g:airline_powerline_fonts=1

" Set colors
highlight nonText ctermfg=240
highlight SpecialKey ctermfg=240
highlight Comment ctermfg=245
highlight LineNr ctermfg=245
