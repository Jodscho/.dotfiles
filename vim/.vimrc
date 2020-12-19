set expandtab tabstop=4 shiftwidth=4
set relativenumber
set nu rnu

syntax on
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
    elseif &filetype == "tex" || &filetype == "plaintex"
        if filereadable("build.sh")
            :!./build.sh Arbeit 
            ":!./build.sh Arbeit && ./clean.sh 
        else
            :!latexmk -output-directory=out -pdf essay.tex
        endif
    elseif &filetype == "markdown"
        :!pandoc % -o %:r.pdf
    else
        echom "can't execute, unknown filetype: " . &filetype
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
nnoremap <F4> :call OpenPdf()<cr>


function! SaveSession()
  let name = system("vim_sessions.sh")
  let fname = substitute(name, '\n$', '', '')
  if empty(fname)
    return
  elseif fname == "new-session"
    let session_name = input('enter session-name: ')
    execute "mksession! ~/vim-sessions/" . session_name
    execute system("notify-send \"created session: " . session_name . "\"") 
  else
    execute "mksession! ~/vim-sessions/" . fname
    execute system("notify-send \"overrode session: " . fname . "\"") 
  endif
endfunction

"function! SaveSession()
"  let name = input('enter session-name: ')
"  execute "mksession! ~/vim-sessions/" . name
"  execute system("notify-send \"created session: " . name . "\"") 
"endfunction

" tab settings -- START
" color of current tab
hi TabLineSel ctermfg=Black ctermbg=White
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

nnoremap <F12> :! bibtex Arbeit.aux<CR>
" latex -- END

" markdown -- START
xnoremap ms xi\mathsf{}<Esc>P
xnoremap $ms xi$\mathsf{}$<Esc>hP
autocmd FileType markdown inoremap ;$fr $\frac{}{}$<Esc>4ha
autocmd FileType markdown inoremap ;fr \frac{}{}<Esc>3ha
autocmd FileType markdown inoremap ;st \{\}<Esc>2ha
autocmd FileType markdown inoremap ;$st $\{\}$<Esc>3ha
autocmd FileType markdown inoremap ;dm \Delta^{\mathcal{T}}
autocmd FileType markdown inoremap ;mc \mathcal{}<Esc>i
autocmd FileType markdown inoremap ;$mc $\mathcal{}$<Esc>hi
autocmd FileType markdown inoremap ;ms \mathsf{}<Esc>i
autocmd FileType markdown inoremap ;$ms $\mathsf{}$<Esc>hi
" markdown -- END

function! DmenuFuzzy(cmd)
  let unstriped = system("find . -type f ! -name '*.swp'| dmenu -i -l 10")
  let fname = substitute(unstriped, '\n$', '', '')
  if empty(fname)
    return
  endif
  execute a:cmd . " " . fname
endfunction

function! OpenPdf()
  echom system('find . -name '.expand('%:r').'.pdf -exec zathura "{}" \; &')
endfunction

nnoremap <C-P> :call DmenuFuzzy("tabe")<cr>
nnoremap <A-1> :call DmenuFuzzy("sp")<cr>
nnoremap <A-9> :call DmenuFuzzy("vs")<cr>
