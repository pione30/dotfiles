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


"dein Scripts-----------------------------
" install directory
let s:dein_dir = expand('~/.cache/dein')
" dein.vim
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" if dein.vim does not exist, clone from github
" and add the directory to runtimepath.
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  "Required:
  execute 'set runtimepath+=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
call dein#begin(s:dein_dir)

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/unite.vim')
call dein#add('scrooloose/syntastic')
call dein#add('thinca/vim-quickrun')
call dein#add('tyru/caw.vim')

" You can specify revision/branch/tag.
" call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

"""""""""""""
" syntastic "
"
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = '-std=c++14 -Wall'
let g:syntastic_haskell_checkers = ['hlint']
let g:syntastic_tex_checkers = ['lacheck']


"""""""""""""""
" neocomplete "
"
"
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


""""""""""""""
" neosnippet "
"
"
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" my snippets directory
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/'


""""""""""""""""
" vim-quickrun "
"
"
if !exists('g:quickrun_config')
  let g:quickrun_config = {}
endif

let g:quickrun_config['tex'] = {
  \   'command' : 'latexmk',
  \   'outputter' : 'error',
  \   'outputter/error/error' : 'buffer',
  \   'outputter/buffer/split' : '',
  \   'cmdopt': '-shell-escape',
  \   'exec': ['%c %o %s'] 
  \ }

let g:quickrun_config['cpp'] = {
  \   'command' : 'g++',
  \   'cmdopt' : '-O2 -std=c++14'
  \ }
" \   'input' : 'input.txt',

let g:quickrun_config['gnuplot'] = {
  \   'command' : 'gnuplot5',
  \   'cmdopt' : '-p -c',
  \   'outputter' : 'error',
  \   'outputter/error/error' : 'buffer'
  \ }


"""""""
" caw "
"
"
" \cで行の先頭にコメントをつけたり外したりできる
" http://ichyo.jp/posts/2014-03-14-how-to-comment-out-with-vim/
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)


"""""""""
" Unite "
"
"
nnoremap <Leader>f :Unite file<CR>
