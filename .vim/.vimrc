set listchars+=tab:▸\ ,eol:¬
set list

" --- Leader Shortcuts ---
let mapleader=","

" # Set env variables
let $BASH_ENV="~/.bash_aliases"

" Fix system clipboard copy/paste in macOS High Seirra
set clipboard=unnamed

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

" nnoremap zV ggzf'<'>zfG

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
" Go to mark
nnoremap <leader>m `

" Treat all numbers as decimal, regardless if there are leading zeros
set nrformats=

" File type config
if has('autocmd')
	filetype plugin indent on " load plugin files and indent files specific to the file type on FileType event
endif
if has('syntax') && !exists('g:syntax_on')
	syntax enable
endif

" Remove trailing whitespace before saving a file
autocmd BufWritePre * %s/\s\+$//e

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

" emmet-vim config
let g:user_emmet_settings = {
\	'javascript.jsx' : {
\		'extends' : 'jsx',
\	},
\}
