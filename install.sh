#!/bin/bash

message ()
{
  RCOLOR=$(( ( RANDOM % 6 )  + 1 ))
  echo -e "Installing \033[1;3${RCOLOR}m$1\033[0m scripts..."
}

# TMUX
message "Tmux"
cp "${PWD}/tmux.conf" ~/.tmux.conf

# ZSH
message "Zshrc"
cp "${PWD}/zshrc" ~/.zshrc

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
if [[ ! -d ~/.vim ]]
then
  mkdir -p ~/.vim/UltiSnips
  cp "${PWD}/vimrc" ~/.vimrc
  cp -fr "${PWD}/UltiSnips" ~/.vim/UltiSnips
else
  echo "There's a vim configuration already installed. Skipping installation."
fi

# Execute it immediately
if [ -n "$ZSH_VERSION" ]; then
  source ~/.zshrc
elif [ -n "$BASH_VERSION" ]; then
  source ~/.bash_profile
fi

# Install Vim Plug
message "Vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install Ripgrep
message "Ripgrep"
if ! command -v rg &> /dev/null; then
  sudo apt-get install -y ripgrep
fi

# Install NeoVim
message "NeoVim"
if [[ ! -d ~/.config/nvim ]]
then
  mkdir ~/.config
  cp -fr "${PWD}/nvim" ~/.config
else
  echo "There's a Neovim configuration already installed. Skipping installation."
fi
