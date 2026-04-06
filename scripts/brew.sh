#!/bin/bash
# Install command-line tools using Homebrew

brew update
brew upgrade

# CLI tools
brew install autojump
brew install bun
brew install eza
brew install fzf
brew install gh
brew install git
brew install jq
brew install killport
brew install lazygit
brew install neovim
brew install nvm
brew install wget

# Casks
brew install --cask claude-code
brew install --cask docker-desktop

brew cleanup
