set listchars+=eol:¬,tab:>.
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
set splitbelow " open new vertical split to the bottom
set splitright " open new horizontal split to the right

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
" easier split navigation
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

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

" --- Ack settings ---
nnoremap <leader>/ :Ack!<space>
" Use ag for Ack
if executable('ag')
  let g:ackprg='ag -i --vimgrep --nocolor'
endif

" Key mapping
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
nnoremap <leader>p :CtrlPFunky<CR>

" Remap CtrlP commands
let g:ctrlp_prompt_mappings={'AcceptSelection("h")': ['<c-h>']}

" Remap NERDTree commands
nnoremap <leader>k :NERDTreeToggle<CR>
let g:NERDTreeMapOpenVSplit='v'
let g:NERDTreeMapOpenSplit='h'

" Configure airline status bar
let g:airline_powerline_fonts=1
let g:airline_section_c = '%t' " only show file name

" Set colors
highlight nonText ctermfg=240
highlight SpecialKey ctermfg=240
highlight Comment ctermfg=245
highlight LineNr ctermfg=245
