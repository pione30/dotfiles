# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Color prompt settings. 
# If the current session is SSH-connected, that will be notified.
#PS1='\u@\h:\w\$ '  # Default
if [ -n "$SSH_CLIENT" ]; then
  text=" ssh-session"
else
  text=""
fi
PS1='\[\e[0;32m\]\u@\h:\[\e[m\]\[\e[1;34m\]\w\[\e[m\]\[\e[1;32m\]${text}\$\[\e[m\] '
# 上の文字列にはカラーセットのエスケープシーケンス (\[\e[color\] で始まり \[\e[m\] で終わる) と情報のプレースホルダが含まれています:
# \u - ユーザー名。元のプロンプトにある \h はホスト名を表示します。
# \w - カレントディレクトリの絶対パス。相対パスを表示するには \W を使います。
# \$ - プロンプト記号 (例: root の場合 #、通常ユーザーの場合 $)。
# \[ と \] - bash にカーソルを正しく配置する方法を知らせるために、このタグはカラーコードの前後に置きます。
# その他の特殊文字については、gnu.org の bash プロンプトのコントロール のウェブページを見て下さい。
unset text

