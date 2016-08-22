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
