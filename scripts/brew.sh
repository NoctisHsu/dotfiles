#!/bin/bash
# Install command-line tools using Homebrew

brew update
brew upgrade

# CLI tools
brew install autojump
brew install bun
brew install eza
brew install fd
brew install fzf
brew install gh
brew install git
brew install jq
brew install killport
brew install lazygit
brew install neovim
brew install nvm
brew install pastel
brew install glow
brew install daipeihust/tap/im-select
brew install ripgrep
brew install starship
brew install tmux
brew install wget
brew install zsh-autosuggestions

# Casks
brew install --cask claude-code
brew install --cask docker-desktop

brew cleanup
