#!/bin/bash

SCRIPT_PATH="$( cd -- "$(dirname "$0")" > /dev/null 2>&1 ; pwd -P )"

ln -sfv "$SCRIPT_PATH/.color_files.py" ~/.color_files.py

ln -sfv "$SCRIPT_PATH/.vimrc" ~/.vimrc

ln -sfv "$SCRIPT_PATH/.vim" ~/.vim

ln -sfv "$SCRIPT_PATH/.zshrc" ~/.zshrc

ln -sfv "$SCRIPT_PATH/.zsh" ~/.zsh

ln -sfv "$SCRIPT_PATH/.zsh_files" ~/.zsh_files

if [ ! -d ~/.config ]
then
	mkdir ~/.config
fi

configs=( "htop" )

for c in "${configs[@]}"
do
	rm -rf ~/.config/$c
	ln -svf "$SCRIPT_PATH/config/$c" ~/.config/$c
done
