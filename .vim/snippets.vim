augroup snippets
    autocmd!
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
    " nnoremap <F12> :! bibtex Arbeit.aux<CR>
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

augroup END
