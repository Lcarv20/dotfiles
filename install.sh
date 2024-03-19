#!/bin/bash

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install casks and packages from bundle
# learn more about Brewfile: https://gist.github.com/ChristopherA/a579274536aab36ea9966f301ff14f3f
brew bundle --file ./Brewfile

# install rosetta for flutter
sudo softwareupdate --install-rosetta --agree-to-license

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

# configure lazygit
ln -s ~/.dotfiles/lazygit ~/.config/lazygit

# configure lsd
ln -s ~/.dotfiles/lsd ~/.config/lsd

# configure nvim
ln -s ~/.dotfiles/nvim ~/.config

# configure gitconfig
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
