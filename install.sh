#!/bin/bash

message ()
{
  RCOLOR=$(( ( RANDOM % 6 )  + 1 ))
  echo -e "Installing \033[1;3${RCOLOR}m$1\033[0m scripts..."
}

# TMUX
message "Tmux"
cp "${PWD}/tmux.conf" ~/.tmux.conf

# BASH
message "Bash"
cp "${PWD}/prompt" ~/.prompt
cp "${PWD}/bash_profile" ~/.bash_profile

# BASH FZF
message "FZF"
rm -rf ~/.fzf
git clone -q https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install > /dev/null 2>&1

# GIT
message "Git"
cp "${PWD}/gitconfig" ~/.gitconfig

# VIM
message "Vim"
cp "${PWD}/vimrc" ~/.vimrc
mkdir ~/.vim
cp -fr "${PWD}/UltiSnips" ~/.vim/UltiSnips

# Execute it immediately
source ~/.bash_profile
