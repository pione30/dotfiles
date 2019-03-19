#!/bin/sh
for df in \.*; do
  # 通常のファイルのみに対してシンボリックリンクを作成する
  if [ -f $df ] && [ $df != ".gitignore" ]; then
    ln -sf ~/dotfiles/$df ~/$df
    echo "ln -sf ~/dotfiles/$df ~/$df"
  fi
done

for config_file in `find .config`; do
  if [ -d $config_file ]; then
    mkdir -p ~/$config_file
  elif [ -f $config_file ]; then
    ln -svf $config_file ~/$config_file
  fi
done
