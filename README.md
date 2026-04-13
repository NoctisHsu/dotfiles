# Dotfiles

Personal configs for zsh and Neovim (LazyVim).

## Setup

```bash
# Clone
cd ~/Work/personal
git clone git@github.com:NoctisHsu/dotfiles.git

# Symlink zsh
ln -sf ~/Work/personal/dotfiles/.zshrc ~/.zshrc

# Symlink nvim
ln -sf ~/Work/personal/dotfiles/nvim ~/.config/nvim

# Symlink tmux
mkdir -p ~/.config/tmux
ln -sf ~/Work/personal/dotfiles/tmux/tmux.conf ~/.config/tmux/tmux.conf
```

## What's included

- `.zshrc` — oh-my-zsh, Starship, zsh-autosuggestions, nvm auto-switch, aliases
- `nvim/` — LazyVim-based Neovim config
- `ghostty/` — Ghostty terminal config (X Dark theme)
- `tmux/` — tmux config with true color, vi keys, minimal status bar
