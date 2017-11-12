"dein Scripts-----------------------------
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " install directory
  let s:dein_dir = expand('~/.cache/dein')
  " dein.vim
  let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

  " if dein.vim does not exist, clone from github
  if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
  endif

  " add the directory to runtimepath.
  execute 'set runtimepath^=' . s:dein_repo_dir

  if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " Let dein manage dein
    call dein#add('Shougo/dein.vim')

    " Add or remove your plugins here:
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('Shougo/denite.nvim')
    call dein#add('scrooloose/syntastic')
    call dein#add('thinca/vim-quickrun')
    call dein#add('tyru/caw.vim')
    call dein#add('kannokanno/previm')
    call dein#add('haya14busa/vim-asterisk')
    call dein#add('haya14busa/vim-migemo')
    call dein#add('cohama/lexima.vim')
    call dein#add('cocopon/iceberg.vim')

    call dein#add('Shougo/deoplete.nvim')
    if !has('nvim')
      call dein#add('roxma/nvim-yarp')
      call dein#add('roxma/vim-hug-neovim-rpc')
    endif

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
