#!/bin/bash
set -e

# Safeguards
if [[ "$0" != "./link.sh" ]]; then
	echo "Please invoke from repo root with './link.sh'"
	exit 1
fi

echo "Hello, thanks for using the automated config linker."

# Make sure all scripts are executable
chmod +x bin/*

# All dotfiles and folders
for dot in `ls -AL dotfiles/`
do
    ln -fs `pwd`/dotfiles/$dot $HOME
    echo "linked $dot to $HOME/$dot"
done

if [ ! -d $HOME/bin ]; then
    ln -fs `pwd`/bin $HOME/bin
    echo "~/bin doesn't exist, linking"
else
	echo -e "\e[33m$HOME/bin exists, please delete and rerun script to link\e[0m"
fi

for conf in `ls -AL home_config/`
do
    ln -fs `pwd`/home_config/$conf $HOME/.config/
    echo "linked $conf to $HOME/.config/$conf"
done

