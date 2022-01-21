#!/bin/bash

if [ $# -eq 1 ]
then
	if [ $1 == "upload" ]
	then
		rsync -av --exclude="bundle/" --exclude=".*/" ~/.zsh* ~/.vim* ~/.color_files.py ~/Gits/Mine/dots/ 
	fi
else
	rsync -av --exclude="bundle/" --exclude=".*/" ~/Gits/Mine/dots/.zsh* ~/Gits/Mine/dots/.vim* ~/Gits/Mine/dots/.color_files.py ~
fi
