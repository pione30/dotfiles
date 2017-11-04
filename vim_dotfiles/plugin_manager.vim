"dein Scripts-----------------------------
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " install directory
  let s:dein_dir = expand('~/.cache/dein')
  " Shougo directory
  let g:Shougo_dir = s:dein_dir . '/repos/github.com/Shougo'
  " dein.vim
  let g:dein_repo_dir = g:Shougo_dir . '/dein.vim'

  " if dein.vim does not exist, clone from github
  " and add the directory to runtimepath.
  if &runtimepath !~# '/dein.vim'
    if !isdirectory(g:dein_repo_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' g:dein_repo_dir
    endif
  endif
  execute 'set runtimepath^=' . g:dein_repo_dir

  if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " Let dein manage dein
    call dein#add('Shougo/dein.vim')

    " Add or remove your plugins here:
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('Shougo/neocomplete.vim')
    call dein#add('Shougo/denite.nvim')
    call dein#add('scrooloose/syntastic')
    call dein#add('thinca/vim-quickrun')
    call dein#add('tyru/caw.vim')
    call dein#add('kannokanno/previm')
    call dein#add('haya14busa/vim-asterisk')
    call dein#add('cohama/lexima.vim')

    " You can specify revision/branch/tag.
    " call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

    call dein#end()
    call dein#save_state()
  endif

  filetype plugin indent on
  syntax enable

  " If you want to install not installed plugins on startup.
  "if dein#check_install()
  "  call dein#install()
  "endif
"End dein Scripts-------------------------
