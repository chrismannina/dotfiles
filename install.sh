#!/bin/bash

# Dotfiles installer script
echo "Installing dotfiles..."

# Create backup directory
mkdir -p ~/.dotfiles_backup

# Function to backup and link
backup_and_link() {
    local source="$1"
    local target="$2"
    
    if [ -e "$target" ]; then
        echo "Backing up existing $(basename $target)"
        mv "$target" ~/.dotfiles_backup/
    fi
    
    echo "Linking $source -> $target"
    ln -sf "$PWD/$source" "$target"
}

# Create necessary directories
mkdir -p ~/.config

# Create symlinks
backup_and_link "shell/zshrc" "$HOME/.zshrc"
backup_and_link "git/gitconfig" "$HOME/.gitconfig"
backup_and_link "starship/starship.toml" "$HOME/.config/starship.toml"
backup_and_link "gh" "$HOME/.config/gh"
backup_and_link "ghostty" "$HOME/.config/ghostty"

# Link nvim config if it exists
if [ -d "./nvim" ]; then
    backup_and_link "nvim" "$HOME/.config/nvim"
fi

echo "Dotfiles installed successfully!"
echo "Restart your terminal or run 'source ~/.zshrc' to apply changes"
