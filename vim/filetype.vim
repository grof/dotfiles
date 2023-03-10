
augroup other_filetypedetect
  autocmd!
  " misc
  autocmd BufNewFile,BufRead *.txt       setf txt
  autocmd BufNewFile,BufRead *.deck      setf deck
  autocmd BufNewFile,BufRead *.moe       setf moe
  autocmd BufNewFile,BufRead *.mxm       setf maxima
augroup END

augroup cursor_position
  autocmd!
  " CURSOR ASSUMES PREVIOUS POSITION
  autocmd BufReadPost * if line("'\"") > 0             |
  \                       if line("'\"") <= line("$")  |
  \                         exe("norm '\"")            |
  \                       else                         |
  \                         exe "norm $"               |
  \                       endif                        |
  \                     endif
augroup END

