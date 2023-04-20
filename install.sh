#!/bin/bash

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# install casks and packages from bundle
brew bundle --file ./Brewfile

# install git if it doesn't exist
if ! command -v git &> /dev/null; then
  brew install git
fi
# clone dotfiles
git clone https://github.com/lcarv/dotfiles.git ~/.dotfiles

# config kitty
ln -s ~/.dotfiles/kitty.conf ~/.config/kitty
# install kitty.terminal
brew install kitty

# configure zsh
ln -s ~/.dotfiles/zsh/.zshrc ~

# configure lsd
ln -s ~/.dotfiles/lsd ~/.config/lsd
