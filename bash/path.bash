# vim: fdm=marker ts=2 sts=-1 sw=0 noet

# Add things to the path

# Start with system path
# Retrieve it from getconf, otherwise it's just current $PATH
if [[ "$OSTYPE" != "msys" ]]; then
	is-executable getconf && PATH=$($(command -v getconf) PATH)
fi

# Prepend new items to path (if directory exists)
# prepend-path is from .function
prepend-path "/bin"
prepend-path "/usr/bin"
prepend-path "/usr/local/bin"
prepend-path "$DOTFILES_DIR/bin"
prepend-path "$HOME/bin"
prepend-path "$HOME/.local/bin"
prepend-path "/sbin"
prepend-path "/usr/sbin"
prepend-path "/usr/local/sbin"
prepend-path "/usr/games"
prepend-path "$HOME/.rvm/bin"
prepend-path "$HOME/.rbenv/bin"

# Remove duplicates (preserving prepended items)
# Source: http://unix.stackexchange.com/a/40755
PATH=$(echo -n "$PATH" | awk -v RS=: '{ if (!arr[$0]++) {printf("%s%s",!ln++?"":":",$0)}}')

export PATH
