#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)
export DOTFILES_DIR DOTFILES_CACHE DOTFILES_EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTFILES_CACHE="$DOTFILES_DIR/.cache.sh"
DOTFILES_EXTRA_DIR="$HOME/.extra"

# Make utilities available
PATH="$DOTFILES_DIR/bin:$PATH"

# Update dotfiles itself first
if is-executable git -a -d "$DOTFILES_DIR/.git" ;then
    git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master
fi

# Bunch of symlinks to ~
ln -sfv "$DOTFILES_DIR/runcom/.bashrc" ~
ln -sfv "$DOTFILES_DIR/runcom/.inputrc" ~
ln -sfv "$DOTFILES_DIR/runcom/.bash_logout" ~
ln -sfv "$DOTFILES_DIR/standalones/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/standalones/.gitignore_global" ~
ln -sfv "$DOTFILES_DIR/standalones/.git-prompt.sh" ~
ln -sfv "$DOTFILES_DIR/standalones/.tmux.conf" ~
ln -sfv "$DOTFILES_DIR/standalones/.vimrc" ~

# Install extra stuff
if [ -d "$DOTFILES_EXTRA_DIR" -a -f "$DOTFILES_EXTRA_DIR/install.sh" ] ;then
  . "$DOTFILES_EXTRA_DIR/install.sh"
fi
