# vim: fdm=marker ts=2 sts=-1 sw=0 noet

# Switch long/short prompt
ps0() {
	unset PROMPT_COMMAND
	PS1='$ '
}

ps1() {
	source "$DOTFILES_DIR/bash/.prompt"
}

# Get named var (usage: get "VAR_NAME")
get() {
	echo "${!1}"
}

# Add to path
prepend-path() {
	[ -d "$1" ] && PATH="$1:$PATH"
}

# Show 256 TERM colors
colors() {
	local X
	X=$(tput op)
	local Y
	Y=$(printf %$((COLUMNS-6))s)

	for i in {0..256}; do
		o=00$i;
		echo -e ${o:${#o}-3:3} "$(tput setaf "$i";tput setab "$i")""${Y// /=}""$X";
	done
}

# Markdown
md() {
	pandoc "$1" | lynx -stdin -dump
}

# https://unix.stackexchange.com/questions/97920/how-to-cd-automatically-after-git-clone
# cd into freshly `git clone` dir
git_clone_into() {
	git clone "$1" && cd "$(basename "$1")"
}

# cd into freshly `svn co` dir
svn_checkout_into() {
	svn checkout "$1" && cd "$(basename "$1")"
}

# Create a new directory and enter it
mk() {
	mkdir -p "$@" && cd "$@"
}

# update and upgrade using apt-fast
apt-all() {
	sudo apt-fast update -y && sudo apt-fast upgrade -y
}
