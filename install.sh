#!/bin/bash

message ()
{
  RCOLOR=$(( ( RANDOM % 6 )  + 1 ))
  echo -e "Installing \033[1;3${RCOLOR}m$1\033[0m scripts..."
}

curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# ZSH
message "Zshrc"
if [[ ! -f ~/.zshrc ]];
then
  cp "${PWD}/zshrc" ~/.zshrc
else
  echo "There's an zsh configuration already installed. Skipping installation."
fi

# TMUX
message "Tmux"
cp "${PWD}/tmux.conf" ~/.tmux.conf

# BASH FZF
message "FZF"
rm -fr ~/.fzf*
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install

# GIT
message "Git"
cp "${PWD}/gitconfig" ~/.gitconfig

# NeoVim
message "NeoVim"
if [[ ! -d ~/.config/nvim ]]
then
  mkdir -p ~/.config
  cp -fr "${PWD}/nvim" ~/.config
else
  echo "There's a Neovim configuration already installed. Skipping installation."
fi

# Ripgrep
message "Ripgrep"
if ! command -v rg &> /dev/null; then
  if [[ "$OSTYPE" == "darwin"* ]]; then
    brew install ripgrep
  else
    sudo apt-get install -y ripgrep
  fi
fi
