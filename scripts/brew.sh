#!/bin/bash
# Install command-line tools using Homebrew

# Make sure we're using the latest Homebrew
brew update
brew upgrade

# CLI tools
brew install autojump
brew install eza
brew install fzf
brew install gh
brew install git
brew install jq
brew install lazygit
brew install neovim
brew install nvm
brew install wget

# Casks
brew install --cask claude-code
brew install --cask docker-desktop
brew install --cask ghostty

# Remove outdated versions from the cellar
brew cleanup
