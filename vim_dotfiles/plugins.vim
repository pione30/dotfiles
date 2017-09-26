"syntastic Scripts------------------------ 
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0

  let g:syntastic_cpp_compiler = 'g++'
  let g:syntastic_cpp_compiler_options = '-std=c++14 -Wall'
  let g:syntastic_css_checkers = ['csslint']
  let g:syntastic_haskell_checkers = ['hlint']
  let g:syntastic_html_checkers = ['htmlhint']
  let g:syntastic_javascript_checkers = ['eslint']
  let g:syntastic_tex_checkers = ['lacheck']
"End syntastic Scripts--------------------

"neocomplete Scripts---------------------- 
  " Disable AutoComplPop.
  let g:acp_enableAtStartup = 0
  " Use neocomplete.
  let g:neocomplete#enable_at_startup = 1
  " Use smartcase.
  let g:neocomplete#enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 3

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
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? "\<C-y>" : "\<CR>"
  endfunction
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
  " Close popup by <Space>.
  "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

  " AutoComplPop like behavior.
  "let g:neocomplete#enable_auto_select = 1

  " Shell like behavior(not recommended).
  "set completeopt+=longest
  "let g:neocomplete#enable_auto_select = 1
  "let g:neocomplete#disable_auto_complete = 1
  "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

  " Enable omni completion.
  augroup neocomplete_omni
    autocmd!
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  augroup END

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
"End neocomplete Scripts------------------

"neosnippet Scripts-----------------------
  " Plugin key-mappings.
  " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)

  " SuperTab like snippets behavior.
  " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  "imap <expr><TAB>
  " \ pumvisible() ? "\<C-n>" :
  " \ neosnippet#expandable_or_jumpable() ?
  " \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

  " For conceal markers.
  if has('conceal')
    set conceallevel=2 concealcursor=niv
  endif

  " my snippets directory
  " let g:neosnippet#snippets_directory = g:Shougo_dir . '/neosnippet-snippets/snippets'
"End neosnippet Scripts-------------------

"vim-quickrun Scripts---------------------
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
"End vim-quickrun Scripts-----------------

"caw Scripts------------------------------
  " \cで行の先頭にコメントをつけたり外したりできる
  " http://ichyo.jp/posts/2014-03-14-how-to-comment-out-with-vim/
  nmap <Leader>c <Plug>(caw:hatpos:toggle)
  vmap <Leader>c <Plug>(caw:hatpos:toggle)
"End caw Scripts--------------------------

"Denite Scripts----------------------------
  nnoremap <Leader>f :Denite file_rec <CR>

	" Change mappings.
	call denite#custom#map(
	      \ 'insert',
	      \ '<C-j>',
	      \ '<denite:move_to_next_line>',
	      \ 'noremap'
	      \)
	call denite#custom#map(
	      \ 'insert',
	      \ '<C-k>',
	      \ '<denite:move_to_previous_line>',
	      \ 'noremap'
	      \)
"End Denite Scripts------------------------

"previm Scripts----------------------------
	let g:previm_open_cmd = 'google-chrome'

  augroup PrevimSettings
      autocmd!
      autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
  augroup END
"End previm Scripts----------------------------
