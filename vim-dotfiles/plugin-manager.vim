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

    let s:toml_dir = expand('~/dotfiles/vim-dotfiles/toml')
    call dein#load_toml(s:toml_dir . '/dein.toml',      {'lazy': 0})
    call dein#load_toml(s:toml_dir . '/dein-lazy.toml', {'lazy': 1})

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
