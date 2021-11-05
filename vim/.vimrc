set relativenumber
set nu rnu
set autoindent
set tabstop=4 shiftwidth=4

syntax on
colorscheme pablo
"colorscheme codedark
"colorscheme monochrome

set visualbell
set t_vb=
set hlsearch

inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

nnoremap <s-c-b> :Texplore<CR>

autocmd FileType cpp setlocal cinoptions+=L0 " disable jump for colon
set shortmess=I
let g:javascript_plugin_jsdoc = 1 " javascript syntax plugin
let g:python_highlight_all = 1 " python syntax plugin

" save files
inoremap <silent> <C-s> <esc>:silent w<cr>
nnoremap <silent> <C-s> :silent w<cr>
" global rename shortcut (replaces every occurrences of a string)
nnoremap <S-A-r> :%s/<c-r>=expand("<cword>")<cr>//g<c-e><left><left>

" pdf functionality
nnoremap <F4> :call OpenPdf()<cr>
function! OpenPdf()
  echom system('find . -name '.expand('%:r').'.pdf -exec zathura "{}" \; &')
endfunction

" replace word with current buffer content
nmap <silent> cp "_cw<C-R>"<Esc>

" spellcheck style
set spell spelllang=de
set spellsuggest=fast
hi clear SpellBad
hi SpellBad cterm=underline

set foldmethod=marker

let g:netrw_winsize = 25
let g:netrw_liststyle = 3
let g:netrw_banner = 0

source ~/.dotfiles/vim/snippets.vim 
source ~/.dotfiles/vim/compile.vim
source ~/.dotfiles/vim/session.vim
source ~/.dotfiles/vim/tabs.vim

autocmd BufWritePost sxhkdrc, !kill -s SIGUSR1 $(pgrep sxhkd) && notify-send updated-sxhkd
