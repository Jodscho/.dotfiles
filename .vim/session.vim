nnoremap <F3> :call SaveSession()<cr>

function! SaveSession()
  let name = system("vim_sessions.sh")
  let fname = substitute(name, '\n$', '', '')
  if empty(fname)
    return
  elseif fname == "new-session"
    let session_name = input('enter session-name: ')
    execute "mksession! ~/.config/vim-sessions/" . session_name
    execute system("notify-send \"created session: " . session_name . "\"") 
  else
    execute "mksession! ~/.config/vim-sessions/" . fname
    execute system("notify-send \"overrode session: " . fname . "\"") 
  endif
endfunction

"function! SaveSession()
"  let name = input('enter session-name: ')
"  execute "mksession! ~/vim-sessions/" . name
"  execute system("notify-send \"created session: " . name . "\"") 
"endfunction


