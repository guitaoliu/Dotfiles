#!/bin/bash

CONFIG_FILES=(
    .gitconfig
    .zshrc
    .vimrc
    .tmux.conf
    .vim/coc-settings.json
    .p10k.zsh
    Brewfile
)

MY_RC_PATH=$(
    cd $(dirname $0)
    pwd
)

# backpack dir
if [ -d ~/old_rcfiles ]; then
    echo "backpack dir already exists!"
else
    echo "backpack dir doesn't exist, create '~/old_rcfiles' instead"
    mkdir ~/old_rcfiles
fi

# backpack the old rc files
# make soft link to myrc
for file in ${CONFIG_FILES[@]}; do
    if [ -f ~/${file} ]; then
        echo "${file} already exist!"
        mv ~/${file} ~/old_rcfiles
    elif [ -h ~/${file} ]; then
        echo "${file} is soft link, move to old_rcfiles"
        mv ~/${file} ~/old_rcfiles
    else
        echo "${file} doesn't exist!"
    fi
    ln -s $MY_RC_PATH/${file} ~/${file}
done
