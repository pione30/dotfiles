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

"deoplete
  " Use deoplete
  let g:deoplete#enable_at_startup = 1
"End deoplete

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

"vim-asterisk
  map *   <Plug>(asterisk-*)
  map #   <Plug>(asterisk-#)
  map g*  <Plug>(asterisk-g*)
  map g#  <Plug>(asterisk-g#)
  map z*  <Plug>(asterisk-z*)
  map gz* <Plug>(asterisk-gz*)
  map z#  <Plug>(asterisk-z#)
  map gz# <Plug>(asterisk-gz#)

  " To enable keepCursor feature
  " let g:asterisk#keeppos = 1
"End vim-asterisk

"iceberg
  colorscheme iceberg
"End iceberg
