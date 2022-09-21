#!/bin/bash
# Install command-line tools using Homebrew

# Make sure we’re using the latest Homebrew
brew update
# Upgrade any already-installed formulae
brew upgrade

brew install autojump
brew install zsh
brew install wget
brew install nvim
brew install fzf
brew install jq
brew install exa
brew install ctop
brew install vtop
brew install lazygit
brew install tig
brew install tmux
brew install gnupg

# Remove outdated versions from the cellar
brew cleanup
