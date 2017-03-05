set listchars+=tab:▸\ ,eol:¬
set list

" --- Leader Shortcuts ---
let mapleader=","

" # Set env variables
let $BASH_ENV="~/.bash_aliases"

" --- Spaces and Tabs ---
set tabstop=2    " number of visual spaces per TAB
set shiftwidth=2 " use 2 spaces when indenting with >>

" --- UI Config ---
set number     " show current line number
set rnu        " show relative line numbers
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
" Search for visually selected text, forwards or backwards
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" --- Movement ---
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" move vertically by line number
nnoremap J j
nnoremap K k
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
Plug 'vim-airline/vim-airline-themes'

" Git stuff
Plug 'tpope/vim-fugitive'

" Show git diff in gutter
Plug 'airblade/vim-gitgutter'

" Solarized color theme and toggle bg
Plug 'altercation/vim-colors-solarized'

" Sub mode awesomeness
Plug 'kana/vim-submode'

" Debugger
Plug 'joonty/vdebug'

" Vim/tmux navigation
Plug 'christoomey/vim-tmux-navigator'

" Syntax plugins
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

call plug#end()

" --- Split resize  ---
let g:submode_timeout = 0 " disable submode timeouts
let g:submode_keep_leaving_key = 1 " don't consume submode-leaving key

call submode#enter_with('split-resize', 'n', '', '<C-w><', '10<C-w><')
call submode#enter_with('split-resize', 'n', '', '<C-w>>', '10<C-w>>')
call submode#enter_with('split-resize', 'n', '', '<C-w>+', '5<C-w>+')
call submode#enter_with('split-resize', 'n', '', '<C-w>-', '5<C-w>-')

" quick resize
call submode#map('split-resize', 'n', '', '<', '10<C-w><')
call submode#map('split-resize', 'n', '', '>', '10<C-w>>')
call submode#map('split-resize', 'n', '', '+', '5<C-w>+')
call submode#map('split-resize', 'n', '', '-', '5<C-w>-')

" other resize
call submode#map('split-resize', 'n', '', '_', '<C-w>_')
call submode#map('split-resize', 'n', '', '<bar>', '<C-w><bar>')
call submode#map('split-resize', 'n', '', '=', '<C-w>=')

" old way, just in case.
nnoremap <Leader>w <C-w>

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
nnoremap <leader>b :CtrlPBuffer<CR>

" Remap CtrlP commands
let g:ctrlp_prompt_mappings={'AcceptSelection("h")': ['<c-h>']}

" Remap NERDTree commands
nnoremap <leader>k :NERDTreeToggle<CR>
let g:NERDTreeMapOpenVSplit='<c-v>'
let g:NERDTreeMapOpenSplit='<c-h>'

" Customize airline status bar
let g:airline_powerline_fonts=1
let g:airline_section_a='' " don't show vim mode
let g:airline_section_c='' " don't show file name as it's displayed in the tabline extension
let g:airline_section_z='%l/%L:%c' " show current line / total lines : column number
let g:airline#extensions#tabline#enabled=1 " enable tabline extension
let g:airline#extensions#tabline#show_tab_type=0 " don't show the tab type
let g:airline#extensions#tabline#left_sep=''
let g:airline#extensions#tabline#left_alt_sep='│'

" Debugger config
if !exists("g:vdebug_options")
	let g:vdebug_options = {}
endif
let g:vdebug_options["path_maps"] = {
	\ '/home/pixieset/public/pixieset.com/public/pixieset/app/': $HOME . '/dev/pixieset/app/',
	\ '/home/pixieset/public/pixieset.com/public/pixieset/framework/': $HOME . '/dev/pixieset/framework/'
	\}

" Set initial color scheme
let colorMode = system('echo -e "tell application \"iTerm2\"\n\ttell current session of current window\n\t\tname\n\tend tell\nend tell" | osascript')
if colorMode =~ 'LightProfile.*'
	set background=light
else
	set background=dark
endif
let g:solarized_bold=0
colorscheme solarized

" Switch color mode commands
function! Dark()
	set background=dark
	silent !dark
endfunction
function! Light()
	set background=light
	silent !light
endfunction
command! Dark call Dark()
command! Light call Light()

if &term =~ '256color'
	" disable Background Color Erase (BCE) so that color schemes
	" render properly when inside 256-color tmux and GNU screen.
	" see also http://snk.tuxfamily.org/log/vim-256color-bce.html
	set t_ut=
endif

" vim-jsx config
let g:jsx_ext_required = 0
