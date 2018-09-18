augroup vimrc_filetypes
  autocmd!
  autocmd BufRead,BufNewFile *.plt set ft=gnuplot
  autocmd BufRead,BufNewFile *.erb set ft=eruby.html
  autocmd BufRead,BufNewFile *.{md,mdwn,mkd,mkdn,mark*} set ft=markdown
  autocmd BufRead,BufNewFile *.slim set ft=slim
augroup END
