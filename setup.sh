#! /bin/sh

DOT_FILES=( .bashrc .inputrc .vimrc .vimrc.bundle .vimrc.plugins_setting .perltidyrc .tmux.conf )

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/rc/$file $HOME/$file
done

[ ! -d ~/.vim/bundle ] && mkdir -p ~/.vim/bundle && git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim && vim -c ':NeoBundleInstall'
