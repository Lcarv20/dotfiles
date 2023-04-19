#!/bin/bash

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle --file ./Brewfile

# install git
brew install git

# clone dotfiles
git clone https://github.com/lcarv/dotfiles.git ~/.dotfiles

# ---------------
# --Kitty.term---
# ---------------
# config kitty
ln -s ~/.dotfiles/kitty.conf ~/.config/kitty
# install kitty.terminal
brew install kitty

# configure zsh
ln -s ~/.dotfiles/zshrc ~/.zshrc
