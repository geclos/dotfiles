#!/bin/bash

message ()
{
  RCOLOR=$(( ( RANDOM % 6 )  + 1 ))
  echo -e "Installing \033[1;3${RCOLOR}m$1\033[0m scripts..."
}

# TMUX
message "Tmux"
ln -snf "${PWD}/tmux.conf" ~/.tmux.conf

# BASH
message "Bash"
ln -snf "${PWD}/prompt" ~/.prompt
ln -snf "${PWD}/bashrc" ~/.bashrc
ln -snf "${PWD}/bash_profile" ~/.bash_profile

# BASH FZF
message "FZF"
rm -rf ~/.fzf
git clone -q https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install > /dev/null 2>&1

# GIT
message "Git"
ln -sf "${PWD}/gitconfig" ~/.gitconfig

# VIM
message "Vim"
ln -snf "${PWD}/vimrc" ~/.vimrc

# Execute it immediately
source ~/.bash_profile
