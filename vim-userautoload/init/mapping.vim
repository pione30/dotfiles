cmap <C-p> <Up>
cmap <C-n> <Down>

" カーソル位置の次の行に空行を挿入します。
" その際、動作実行後もノーマルモードを維持し、なおかつ必ず無駄な文字が入ることなく空行が挿入されます。
nnoremap O :<C-u>call append(expand('.'), '')<Cr>j

" コマンドラインプロンプトに %% と入力すると %:h として展開する.
" %:h はアクティブなバッファの相対パスのディレクトリ部分.
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" <Leader> をスペースキーに, <LocalLeader> を \ にマッピングする
noremap <Leader>      <Nop>
noremap <LocalLeader> <Nop>
let g:mapleader = "\<Space>"
let g:maplocalleader = '\'
