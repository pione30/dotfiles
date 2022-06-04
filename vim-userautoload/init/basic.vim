if &compatible
  set nocompatible " Be iMproved
endif

filetype plugin indent on

set mouse=a

set number

set history=200

set nrformats-=octal " 0 始まりの数字を 8 進数 Ctrl-A / Ctrl-X しない
set nrformats+=alpha " アルファベットを Ctrl-A / Ctrl-X できるようにする

set splitbelow " splitする際は現在のバッファの下に新しいバッファを開く

set backspace=indent,eol,start " more powerful backspacing

set cursorline
highlight Normal ctermbg=none
highlight Cursorline term=none cterm=none ctermfg=none ctermbg=darkgray

" 最初の1回目の <Tab> では共通部分までの補完をしつつ補完候補を出し、
" 次回以降はこの補完候補を順に選択する
set wildmenu
set wildmode=list:longest,list:full

" % コマンドで対となるキーワードの組の間を移動できるようにする
runtime macros/matchit.vim

" TeXのconcealを無効化
let g:tex_conceal=''

augroup vimrc_basic
  autocmd!
  " grep の後, 自動的に copen する
  autocmd QuickFixCmdPost *grep* copen
  " 保存時にフックして常に末尾の空白を削除する
  autocmd BufWritePre * call s:removeTrailingWhiteSpace()
augroup END

func! s:removeTrailingWhiteSpace()
  if &ft != 'markdown'
    :%s/\s\+$//ge
  endif
endf
