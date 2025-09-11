# My Dotfiles

Personal configuration files for macOS development environment.

## What's included

- **Shell**: Zsh configuration with NVM, pyenv, starship prompt
- **Git**: Basic Git configuration  
- **Starship**: Custom prompt configuration
- **GitHub CLI**: GitHub CLI configuration and authentication
- **Ghostty**: Terminal emulator configuration
- **Homebrew**: Brewfile for package management

## Installation
```bash
git clone git@github.com:chrismannina/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

## Updating 
To sync your current system configs back to the dotfiles repo:
```bash
cd ~/.dotfiles
./update.sh
git add .
git commit -m "Update configs"
git push
```
Manual Setup
After running the install script, you may need to:

Install Homebrew packages: brew bundle install
Restart your terminal
Configure any additional settings

Backup
Original files are backed up to ~/.dotfiles_backup/ before symlinking.
