set expandtab tabstop=4 shiftwidth=4
set relativenumber
set nu rnu

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

" save files
inoremap <silent> <C-s> <esc>:silent w<cr>
nnoremap <silent> <C-s> :silent w<cr>
" save and exit
inoremap <C-d> <esc>:wq!<cr>
nnoremap <C-d> :wq!<cr>

nnoremap <C-x> :call ExecuteProg()<cr>

function! ExecuteProg()
    if &filetype == "cpp"
        :! g++ % && ./a.out
    elseif &filetype == "python"
        :! python3 %
    elseif &filetype == "tex"
        :!latexmk -output-directory=out -pdf essay.tex
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

nnoremap <F3> :call SaveSession()<cr>

function! SaveSession()
  let name = input('enter session-name: ')
  execute "mksession! ~/vim-sessions/" . name
  execute system("notify-send \"created session: " . name . "\"") 
endfunction

" tab settings -- START
" color of current tab
hi TabLineSel ctermfg=White ctermbg=Grey
" open ctags in new tab
nmap g<C-]> :execute 'tab tag '.expand('<cword>')<CR>
" always show file in tab
set showtabline=2
" tab settings -- END

" spellcheck style
set spell spelllang=en_us
hi clear SpellBad
hi SpellBad cterm=underline

" latex -- START
autocmd FileType tex inoremap ;fig \begin{figure}[htb]<Enter>\begin{center}<Enter>\includegraphics[width=0.6\textwidth]{figures/}<Enter>\end{center}<Enter>\caption{}<Enter>\label{fig:}<Enter>\end{figure}

autocmd FileType tex inoremap ;lis \begin{lstlisting}<Enter><Enter>\end{lstlisting}<Esc>ki

autocmd FileType tex inoremap ;sb \subsection{}<Esc>i
autocmd FileType tex inoremap ;sc \section{}<Esc>i

autocmd FileType tex inoremap ;it \textit{}<Esc>i
autocmd FileType tex inoremap ;bf \textbf{}<Esc>i
xnoremap it xi\textit{}<Esc>P
xnoremap bf xi\textbf{}<Esc>P
xnoremap qt xi``''<Esc>hP

nnoremap <F12> :! bibtex out/essay.aux<CR>

" latex -- END

function! DmenuFuzzy(cmd)
  let unstriped = system("find . -type f ! -name '*.swp'| dmenu -i -l 10")
  let fname = substitute(unstriped, '\n$', '', '')
  if empty(fname)
    return
  endif
  execute a:cmd . " " . fname
endfunction

nnoremap <C-P> :call DmenuFuzzy("tabe")<cr>
nnoremap <A-1> :call DmenuFuzzy("sp")<cr>
nnoremap <A-9> :call DmenuFuzzy("vs")<cr>
