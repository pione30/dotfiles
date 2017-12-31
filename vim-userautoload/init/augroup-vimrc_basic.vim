augroup vimrc_basic
  autocmd!
  autocmd BufRead,BufNewFile *.plt setf gnuplot
  autocmd BufRead,BufNewFile *.hs set tabstop=8
  autocmd BufRead,BufNewFile *.py set tabstop=4 shiftwidth=4
  autocmd BufRead,BufNewFile Makefile set noexpandtab
augroup END
