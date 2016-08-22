set mouse=a

set number

filetype plugin indent on
au BufNewFile,BufRead *.plt setf gnuplot

set expandtab
set tabstop=2
set shiftwidth=2 " 自動インデントでずれる幅
au BufNewFile,BufRead *.hs set tabstop=8
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead Makefile set noexpandtab
set autoindent  " 改行時に前の行のインデントを継続する
set smartindent " 幾つかのC構文を認識し、適切な箇所のインデントを増減させる

set incsearch
set ignorecase
set smartcase
set wrapscan   " 検索がファイル末尾まで進んだら、ファイル先頭から再び検索する
set hlsearch   " マッチを強調表示する

cmap <C-p> <Up>
cmap <C-n> <Down>

set wildmenu
" 最初の1回目の <Tab> では共通部分までの補完をしつつ補完候補を出し、
" 次回以降はこの補完候補を順に選択する
set wildmode=list:longest,list:full

set splitbelow " splitする際は現在のバッファの下に新しいバッファを開く

set cursorline
highlight Normal ctermbg=none
highlight Cursorline term=none cterm=none ctermfg=none ctermbg=darkgray

" ビジュアルモードで選択したテキストが、クリップボードに入るようにする
" http://nanasi.jp/articles/howto/editing/clipboard.html
" set clipboard=autoselect
 
" 無名レジスタに入るデータを、*レジスタにも入れる。
" 以下のどちらかを有効にすると良い。
" set clipboard+=unnamed
set clipboard=unnamedplus

" TeXのconcealを無効化
let g:tex_conceal=''
