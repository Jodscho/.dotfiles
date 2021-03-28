
" color of current tab
hi TabLineSel ctermfg=Black ctermbg=White
" open ctags in new tab
nmap g<C-]> :execute 'tab tag '.expand('<cword>')<CR>
" always show file in tab
set showtabline=2

function! DmenuFuzzy(cmd)
  let unstriped = system("find . -type f ! -name '*.swp'| dmenu -i -l 10")
  let fname = substitute(unstriped, '\n$', '', '')
  if empty(fname)
    return
  endif
  execute a:cmd . " " . fname
endfunction

"open tabs/splits
nnoremap <C-P> :call DmenuFuzzy("tabe")<cr>
nnoremap <A-1> :call DmenuFuzzy("sp")<cr>
nnoremap <A-9> :call DmenuFuzzy("vs")<cr>

"move tabs
nnoremap <S-h> :tabprev<cr>
nnoremap <S-l> :tabnext<cr>
nnoremap <ESC>[72;5u :tabm -1<cr>
nnoremap <ESC>[76;5u :tabm +1<cr>
