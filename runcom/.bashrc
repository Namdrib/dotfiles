# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Inspired by
# https://github.com/webpro/dotfiles/blob/master/runcom/.bash_profile and
# https://github.com/anishathalye/dotfiles/blob/master/bashrc
# basically just sources other dotfiles

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Resolve DOTFILES_DIR (assuming ~/.dotfiles on distros without readlink and/or $BASH_SOURCE/$0)
READLINK=$(which greadlink || which readlink)
CURRENT_SCRIPT=$BASH_SOURCE

if [[ -n $CURRENT_SCRIPT && -x "$READLINK" ]]; then
  SCRIPT_PATH=$($READLINK -f "$CURRENT_SCRIPT")
  DOTFILES_DIR=$(dirname "$(dirname "$SCRIPT_PATH")")
elif [ -d "$HOME/.dotfiles" ]; then
  DOTFILES_DIR="$HOME/.dotfiles"
else
  echo "Unable to find dotfiles, exiting."
  return
fi

# Make utilities available
PATH="$DOTFILES_DIR/bin:$PATH"

# Source dotfiles (order matters)
for DOTFILE in "$DOTFILES_DIR"/system/.{function,path,env,alias,prompt,vimrc}; do
	[ -f  "$DOTFILE" ] && . "$DOTFILE"
done

# Hook for extra/custom stuff
DOTFILES_EXTRA_DIR="$HOME/.extra"

if [ -d "$DOTFILES_EXTRA_DIR" ]; then
  for EXTRAFILE in "$DOTFILES_EXTRA_DIR"/runcom/.*; do
    [ -f "$EXTRAFILE" ] && . "$EXTRAFILE"
  done
fi

# Clean up
unset READLINK CURRENT_SCRIPT SCRIPT_PATH DOTFILE DOTFILES_EXTRA_DIR EXTRAFILE

# export
export DOTFILES_DIR
