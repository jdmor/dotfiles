" Configure scrooloose/nerdtree
" Mapping for show/hide directory toggle
nnoremap <leader>k :NERDTreeToggle<CR>
" let g:NERDTreeMapOpenVSplit='<c-v>'
" let g:NERDTreeMapOpenSplit='<c-h>'

" ---

" Configure ctrlpvim/ctrlp.vim
let g:ctrlp_match_window='bottom,order:ttb' " Show results from top to bottom
let g:ctrlp_user_command='ag %s -l --nocolor -g ""' " Use ag to search, which is much faster
let g:ctrlp_map='<c-p>' " ctrlp mapping
let g:ctrlp_cmd='CtrlP' " Default command when above mapping pressed
let g:ctrlp_prompt_mappings={'AcceptSelection("h")': ['<c-h>']} " In ctrlp ctrlp window, remap 'h'
" Mapping for search buffers
nnoremap <leader>b :CtrlPBuffer<CR>

" ---

" Configure tacahiroy/ctrlp-funky
nnoremap <leader>p :CtrlPFunky<CR>

" ---

" Configure mileszs/ack.vim
" Create shortcut to Ack
nnoremap <leader>/ :Ack!<space>
" Use ag for super fast search
if executable('ag')
  let g:ackprg='ag -i --vimgrep --nocolor'
endif

" ---

" Configure kana/vim-submode
let g:submode_timeout = 0 " Disable submode timeouts
let g:submode_keep_leaving_key = 1 " Don't consume submode-leaving key

" Resize submode - handled by kana/vim-submode plugin
" Keys that enter into submode
call submode#enter_with('split-resize', 'n', '', '<C-w><', '10<C-w><')
call submode#enter_with('split-resize', 'n', '', '<C-w>>', '10<C-w>>')
call submode#enter_with('split-resize', 'n', '', '<C-w>+', '5<C-w>+')
call submode#enter_with('split-resize', 'n', '', '<C-w>-', '5<C-w>-')
" Quick resize
call submode#map('split-resize', 'n', '', '<', '10<C-w><')
call submode#map('split-resize', 'n', '', '>', '10<C-w>>')
call submode#map('split-resize', 'n', '', '+', '5<C-w>+')
call submode#map('split-resize', 'n', '', '-', '5<C-w>-')
" Other resize
call submode#map('split-resize', 'n', '', '_', '<C-w>_')
call submode#map('split-resize', 'n', '', '<bar>', '<C-w><bar>')
call submode#map('split-resize', 'n', '', '=', '<C-w>=')
nnoremap <C-w>z <C-w>_<C-w><bar> " maximize split

" Old way, just in case.
nnoremap <Leader>w <C-w>
