#!/bin/sh
for df in \.*; do
  # 通常のファイルのみに対してシンボリックリンクを作成する
  if [ -f $df ] && [ $df != ".gitignore" ]; then
    ln -sf ~/dotfiles/$df ~/$df
    echo "ln -sf ~/dotfiles/$df ~/$df"
  fi
done
