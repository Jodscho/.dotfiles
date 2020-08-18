set expandtab tabstop=4 shiftwidth=4
set relativenumber
set nu rnu

set nocompatible              
filetype off                 

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tomasiser/vim-code-dark'
Plugin 'bfrg/vim-cpp-modern'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-python/python-syntax'
Plugin 'tpope/vim-surround'
Plugin 'junegunn/fzf'

" All of your Plugins must be added before the following line
call vundle#end()            
filetype plugin indent on

colorscheme codedark

inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

nnoremap <s-c-b> :Texplore<CR>

let g:netrw_banner = 0
" disable jump for colon
autocmd FileType cpp setlocal cinoptions+=L0
set shortmess=I

" javascript syntax plugin
let g:javascript_plugin_jsdoc = 1

" python syntax plugin
let g:python_highlight_all = 1

" open ctags in new tab
nmap g<C-]> :execute 'tab tag '.expand('<cword>')<CR>

" save shortcuts
inoremap <C-s> <esc>:w<cr>                 " save files
nnoremap <C-s> :w<cr>
inoremap <C-d> <esc>:wq!<cr>               " save and exit
nnoremap <C-d> :wq!<cr>
inoremap <C-q> <esc>:qa!<cr>               " quit discarding changes
nnoremap <C-q> :qa!<cr>


nnoremap <C-x> :call ExecuteProg()<cr>


function! ExecuteProg()
    if &filetype == "cpp"
        :! g++ % && ./a.out
    elseif &filetype = "python"
        python3 %
    else
        echom "can't execute, unknown filetype"
    endif
endfunction

" global rename shortcut
nnoremap <S-A-r> :%s/<c-r>=expand("<cword>")<cr>//g<c-e><left><left>

" move tabs
nnoremap <S-h> :tabprev<cr>
nnoremap <S-l> :tabnext<cr>
nnoremap <ESC>[72;5u :tabm -1<cr>
nnoremap <ESC>[76;5u :tabm +1<cr>

" fuzzy finder settings
let g:fzf_action = {'enter': 'tab split'}
let g:fzf_layout = { 'down': '10%' }
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>" " proper close on esc
nnoremap <C-P> :FZF<cr>

nnoremap <F3> :mksession! ~/mysession.vim<cr>

" ctags: open in new tab
nmap <C-W> :execute 'tab tag '.expand('<cword>')<CR>

"color of current tab
hi TabLineSel ctermfg=White ctermbg=Grey

