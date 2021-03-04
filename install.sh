#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)
export DOTFILES_DIR DOTFILES_CACHE DOTFILES_EXTRA_DIR DOTFILES_HOME
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTFILES_CACHE="$DOTFILES_DIR/.cache.sh"
DOTFILES_EXTRA_DIR="$HOME/.extra"
DOTFILES_HOME="$HOME/.dotfiles"

# Make utilities available
PATH="$DOTFILES_DIR/bin:$PATH"

# Update dotfiles itself first
if is-executable git -a -d "$DOTFILES_DIR/.git"; then
	git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master
fi

# Create home dotfiles symlink
# ln -sfv "$DOTFILES_DIR/" "$DOTFILES_HOME"

# Specifically link dotfiles to the home one
linkables=$( ls -d **/*.symlink )
for file in $linkables ;do
	target="$HOME/.$( basename "$file" ".symlink" )"
	ln -sfv "$DOTFILES_HOME/$file" "$target"
done

# Install extra stuff
if [ -d "$DOTFILES_EXTRA_DIR" ] && [ -f "$DOTFILES_EXTRA_DIR/install.sh" ] ;then
	source "$DOTFILES_EXTRA_DIR/install.sh"
fi
