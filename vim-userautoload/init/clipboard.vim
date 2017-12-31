set clipboard& " clipboard オプションの値をデフォルト値にセットする 

" OS により利用するレジスタが異なるので分岐させる
if has('win32') || has('win64') || has('mac')
  set clipboard^=unnamed " 無名レジスタに入るデータを * レジスタにも入れる
else
  set clipboard^=unnamed,unnamedplus " 無名レジスタに入るデータを * レジスタ, + レジスタにも入れる
endif

" set clipboard^=autoselect " ビジュアルモードで選択したテキストが、クリップボードに入るようにする
