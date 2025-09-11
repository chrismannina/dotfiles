#!/bin/bash

# Dotfiles update script
# Syncs current system configs back to the dotfiles repo

echo "Updating dotfiles from system configs..."

# Function to copy file with confirmation
update_file() {
    local source="$1"
    local target="$2"
    
    if [ -e "$source" ]; then
        if [ -e "$target" ]; then
            if ! cmp -s "$source" "$target"; then
                echo "Updating $target from $source"
                cp "$source" "$target"
            else
                echo "No changes in $(basename $target)"
            fi
        else
            echo "Creating new file $target"
            mkdir -p "$(dirname $target)"
            cp "$source" "$target"
        fi
    else
        echo "Warning: $source not found"
    fi
}

# Function to copy directory with confirmation  
update_directory() {
    local source="$1"
    local target="$2"
    
    if [ -d "$source" ]; then
        echo "Updating directory $target from $source"
        mkdir -p "$target"
        cp -r "$source"/* "$target"/
    else
        echo "Warning: $source directory not found"
    fi
}

# Update individual files
update_file "$HOME/.zshrc" "shell/zshrc"
update_file "$HOME/.gitconfig" "git/gitconfig"
update_file "$HOME/.config/starship.toml" "starship/starship.toml"
update_file "$HOME/.config/gh/config.yml" "gh/config.yml"
update_file "$HOME/.config/gh/hosts.yml" "gh/hosts.yml"
update_file "$HOME/.config/ghostty/config" "ghostty/config"

# Update directories
if [ -d "$HOME/.config/nvim" ]; then
    update_directory "$HOME/.config/nvim" "nvim"
fi

# Update Brewfile
echo "Updating Brewfile..."
brew bundle dump --file=homebrew/Brewfile --force

echo "Update complete!"
echo "Review changes with: git diff"
echo "Commit changes with: git add . && git commit -m 'Update configs'"
