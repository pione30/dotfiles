set expandtab
set tabstop=2
set shiftwidth=2 " 自動インデントでずれる幅
set autoindent  " 改行時に前の行のインデントを継続する
set smartindent " 幾つかのC構文を認識し、適切な箇所のインデントを増減させる

" augroup を別ファイルにするかは迷ったが, tab 関連の設定順序が前後すると
" 良くなさそうと思ったので, とりあえずここに書く
augroup vimrc_basic
  autocmd!
  autocmd BufRead,BufNewFile *.plt setf gnuplot
  autocmd BufRead,BufNewFile *.hs set tabstop=8
  autocmd BufRead,BufNewFile *.py set tabstop=4 shiftwidth=4
  autocmd BufRead,BufNewFile *.cs set tabstop=4 shiftwidth=4
  autocmd BufRead,BufNewFile Makefile set noexpandtab
augroup END
