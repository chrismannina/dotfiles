# dotfiles

macOS terminal setup shared between my work and personal Macs:
Ghostty + Catppuccin, Starship prompt, zsh, git, and Homebrew apps.

## Install

```bash
# 1. Homebrew: https://brew.sh
# 2. Clone and run
git clone https://github.com/chrismannina/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install work        # or: ./install personal
```

Then set your name and email in `~/.gitconfig.local` and open a new terminal.

`./install` is safe to re-run. It symlinks each config into place, backing up
anything it replaces to `~/.dotfiles_backup/<timestamp>/`. Because the files are
symlinks, editing `~/.zshrc` (etc.) edits the repo directly; there is no separate
"sync" step. Just commit.

## Layout

| Path | Linked to | What |
|---|---|---|
| `zsh/zshrc` | `~/.zshrc` | History, completion, aliases, fzf/zoxide/direnv, prompt |
| `zsh/zprofile` | `~/.zprofile` | Homebrew PATH |
| `git/gitconfig` | `~/.gitconfig` | Aliases and defaults |
| `git/ignore` | `~/.config/git/ignore` | Global gitignore |
| `starship/starship.toml` | `~/.config/starship.toml` | Prompt |
| `ghostty/config` | `~/.config/ghostty/config` | Terminal theme, font, keybinds |
| `fastfetch/config.jsonc` | `~/.config/fastfetch/config.jsonc` | Greeting shown in new Ghostty windows |
| `brew/Brewfile` | — | Tools and apps for every machine |
| `brew/Brewfile.work`, `brew/Brewfile.personal` | — | Per-machine extras |

## Machine-specific settings

These files are **not tracked**, so they stay off GitHub:

- `~/.zshrc.local`: aliases, paths, and anything employer-specific
- `~/.gitconfig.local`: `user.name` / `user.email` for that machine

Commits inside `~/.dotfiles` always use the personal identity in
`git/personal.gitconfig`, whatever machine they're made on.

## Day to day

```bash
dots                                   # cd ~/.dotfiles
brew bundle check --file=brew/Brewfile # anything missing?
cat brew/Brewfile brew/Brewfile.work | brew bundle cleanup --file=-   # installed but not listed
```

Theme: change the `theme =` line in `ghostty/config`, then press Cmd+Shift+,.
The prompt uses ANSI colors, so it follows whatever theme Ghostty uses.

## Key bindings

| Keys | Does |
|---|---|
| Ctrl+` | Drop-down terminal from any app |
| Ctrl+R | Fuzzy history search |
| Ctrl+T | Fuzzy file search |
| → | Accept autosuggestion |
| `z <name>` | Jump to a frequently used folder |
