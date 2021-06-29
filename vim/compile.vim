nnoremap <C-x> :call ExecuteProg()<cr>

function! ExecuteProg()

    if &filetype == "c"
        :! gcc % && ./a.out
    elseif &filetype == "cpp"
        :! g++ % && ./a.out
    elseif &filetype == "python"
        :! python3 %
    elseif &filetype == "tex" || &filetype == "plaintex"
        if filereadable("build.sh")
            ":!./build.sh Arbeit 
            :!./build.sh Arbeit && ./clean.sh 
        else
            :!latexmk -output-directory=out -pdf %
        endif
    elseif &filetype == "markdown"
        :!pandoc % -o %:r.pdf
    else
        echom "can't execute, unknown filetype: " . &filetype
    endif
endfunction


