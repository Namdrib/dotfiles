#!/usr/bin/env bash
# vim: fdm=marker ts=2 sts=-1 sw=0 noet

# Get current dir (so run this script from anywhere)
export DOTFILES_DIR DOTFILES_CACHE DOTFILES_EXTRA_DIR DOTFILES_HOME
DOTFILES_DIR="$( cd "$( /usr/bin/dirname "${BASH_SOURCE[0]}" )" && /usr/bin/pwd )"
DOTFILES_CACHE="$DOTFILES_DIR/.cache.sh"
DOTFILES_EXTRA_DIR="$HOME/.extra"
DOTFILES_HOME="$HOME/.dotfiles"

# Make utilities available
PATH="$DOTFILES_DIR/bin:$PATH"

# Update dotfiles itself first
if is-executable git -a -d "$DOTFILES_DIR/.git"; then
	/usr/bin/git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master
fi

# Create home dotfiles symlink
if [ ! -L "${DOTFILES_HOME}" ]; then
	/usr/bin/ln -sfv "$DOTFILES_DIR/" "$DOTFILES_HOME"
fi

# Specifically link dotfiles to the home one
linkables=$( /usr/bin/ls -d -- **/*.symlink )
for file in $linkables ;do
	target="$HOME/.$( /usr/bin/basename "$file" ".symlink" )"
	/usr/bin/ln -sfv "$DOTFILES_HOME/$file" "$target"
done

# Install extra stuff
if [ -d "$DOTFILES_EXTRA_DIR" ] && [ -f "$DOTFILES_EXTRA_DIR/install.sh" ] ;then
	source "$DOTFILES_EXTRA_DIR/install.sh"
fi

# Install fish environment
FISHCONF_DIR="${HOME}/.config/fish/conf.d"
/usr/bin/mkdir -p "${FISHCONF_DIR}"
# shellcheck disable=SC2231
for fish_file in ${DOTFILES_HOME}/fish/conf.d/*.fish; do
	target="${FISHCONF_DIR}/$( /usr/bin/basename "${fish_file}" )"
	/usr/bin/ln -sfv "${fish_file}" "${target}"
done
