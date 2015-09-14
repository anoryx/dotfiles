#!/usr/bin/env bash

# Install Homebrew & brew-cask

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap caskroom/cask
brew install brew-cask
brew tap homebrew/versions
brew tap caskroom/versions

# Install brew & brew-cask packages

. "$DOTFILES_DIR/osx/brew.sh"
. "$DOTFILES_DIR/osx/brew-cask.sh"

# Install bash (with Homebrew)

. "$DOTFILES_DIR/osx/bash.sh"
