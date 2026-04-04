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
```

## What's included

- `.zshrc` — oh-my-zsh, p10k, nvm auto-switch, aliases
- `nvim/` — LazyVim-based Neovim config
