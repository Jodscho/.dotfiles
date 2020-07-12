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

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

colorscheme codedark

" automatic closing brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
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
