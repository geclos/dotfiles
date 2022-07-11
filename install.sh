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
if [[ ! -d ~/.oh-my-zsh ]] || [[ ! -f ~/.zshrc ]];
then
  cp -a "${PWD}/ohmyzsh/." ~/.oh-my-zsh/
  cp "${PWD}/zshrc" ~/.zshrc
else
  echo "There's an zsh configuration already installed. Skipping installation."
fi

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
if [[ ! -d ~/.vim ]] || [[ ! -f ~/.vimrc ]];
then
  cp "${PWD}/vimrc" ~/.vimrc
else
  echo "There's an vim configuration already installed. Skipping installation."
fi

# NeoVim
message "NeoVim"
if [[ ! -d ~/.config/nvim ]]
then
  mkdir -p ~/.config
  cp -fr "${PWD}/nvim" ~/.config
else
  echo "There's a Neovim configuration already installed. Skipping installation."
fi

# Vim Plug
message "Vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Ripgrep
message "Ripgrep"
if ! command -v rg &> /dev/null; then
  if [[ "$OSTYPE" == "darwin"* ]]; then
    brew install ripgrep
  else
    sudo apt-get install -y ripgrep
  fi
fi

source ~/.zshrc
