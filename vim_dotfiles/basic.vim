filetype plugin indent on

set mouse=a

set number

set expandtab
set tabstop=2
set shiftwidth=2 " 自動インデントでずれる幅
set autoindent  " 改行時に前の行のインデントを継続する
set smartindent " 幾つかのC構文を認識し、適切な箇所のインデントを増減させる

augroup vimrc_basic
  autocmd!
  autocmd BufRead,BufNewFile *.plt setf gnuplot
  autocmd BufRead,BufNewFile *.hs set tabstop=8
  autocmd BufRead,BufNewFile *.py set tabstop=4 shiftwidth=4
  autocmd BufRead,BufNewFile Makefile set noexpandtab
augroup END

set incsearch
set ignorecase
set smartcase
set wrapscan   " 検索がファイル末尾まで進んだら、ファイル先頭から再び検索する
set hlsearch   " マッチを強調表示する

set history=200

set nrformats-=octal " 0 始まりの数字を 8 進数 Ctrl-A / Ctrl-X しない
set nrformats+=alpha " アルファベットを Ctrl-A / Ctrl-X できるようにする

set splitbelow " splitする際は現在のバッファの下に新しいバッファを開く

set backspace=indent,eol,start " more powerful backspacing

set cursorline
highlight Normal ctermbg=none
highlight Cursorline term=none cterm=none ctermfg=none ctermbg=darkgray

cmap <C-p> <Up>
cmap <C-n> <Down>

" カーソル位置の次の行に空行を挿入します。
" その際、動作実行後もノーマルモードを維持し、なおかつ必ず無駄な文字が入ることなく空行が挿入されます。
nnoremap O :<C-u>call append(expand('.'), '')<Cr>j

" 最初の1回目の <Tab> では共通部分までの補完をしつつ補完候補を出し、
" 次回以降はこの補完候補を順に選択する
set wildmenu
set wildmode=list:longest,list:full

set clipboard& " clipboard オプションの値をデフォルト値にセットする 
set clipboard^=unnamedplus " 無名レジスタに入るデータを + レジスタにも入れる
" set clipboard^=autoselect " ビジュアルモードで選択したテキストが、クリップボードに入るようにする

" TeXのconcealを無効化
let g:tex_conceal=''

