# source .common_profile
if [ -f ~/.common_profile ]; then
  source ~/.common_profile
fi

fpath=(/usr/local/share/zsh-completions $fpath)
fpath=(/usr/local/share/zsh/site-functions $fpath)
fpath=(~/.zsh/completion $fpath)
