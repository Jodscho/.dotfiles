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
