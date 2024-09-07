## Prompt

_bash_prompt_config() {

	local USER_SYMBOL
	USER_SYMBOL="\u"
	local HOST_SYMBOL
	HOST_SYMBOL="\h"
	local ESC_OPEN
	ESC_OPEN="\["
	local ESC_CLOSE
	ESC_CLOSE="\]"

	if tput setaf >/dev/null 2>&1; then
		_setaf () { tput setaf "$1" ; }
		local RESET
		RESET="${ESC_OPEN}$( { tput sgr0 || tput me ; } 2>/dev/null )${ESC_CLOSE}"
		local BOLD
		BOLD="$( { tput bold || tput md ; } 2>/dev/null )"
	else
		# Fallback
		_setaf () { echo "\033[0;$(($1+30))m" ; }
		local RESET
		RESET="\033[m"
		local BOLD
		BOLD=""
		ESC_OPEN=""
		ESC_CLOSE=""
	fi

	# Normal colors
	local BLACK
	BLACK="${ESC_OPEN}$(_setaf 0)${ESC_CLOSE}"
	local RED
	RED="${ESC_OPEN}$(_setaf 1)${ESC_CLOSE}"
	local GREEN
	GREEN="${ESC_OPEN}$(_setaf 2)${ESC_CLOSE}"
	local YELLOW
	YELLOW="${ESC_OPEN}$(_setaf 3)${ESC_CLOSE}"
	local BLUE
	BLUE="${ESC_OPEN}$(_setaf 4)${ESC_CLOSE}"
	local VIOLET
	VIOLET="${ESC_OPEN}$(_setaf 5)${ESC_CLOSE}"
	local CYAN
	CYAN="${ESC_OPEN}$(_setaf 6)${ESC_CLOSE}"
	local WHITE
	WHITE="${ESC_OPEN}$(_setaf 7)${ESC_CLOSE}"

	# Bright colors
	local BRIGHT_RED
	BRIGHT_RED="${ESC_OPEN}$(_setaf 9)${ESC_CLOSE}"
	local BRIGHT_GREEN
	BRIGHT_GREEN="${ESC_OPEN}$(_setaf 10)${ESC_CLOSE}"
	local BRIGHT_YELLOW
	BRIGHT_YELLOW="${ESC_OPEN}$(_setaf 11)${ESC_CLOSE}"
	local BRIGHT_BLUE
	BRIGHT_BLUE="${ESC_OPEN}$(_setaf 12)${ESC_CLOSE}"
	local BRIGHT_VIOLET
	BRIGHT_VIOLET="${ESC_OPEN}$(_setaf 13)${ESC_CLOSE}"
	local BRIGHT_CYAN
	BRIGHT_CYAN="${ESC_OPEN}$(_setaf 14)${ESC_CLOSE}"
	local BRIGHT_WHITE
	BRIGHT_WHITE="${ESC_OPEN}$(_setaf 15)${ESC_CLOSE}"

	# Bold colors
	local BLACK_BOLD
	BLACK_BOLD="${ESC_OPEN}${BOLD}$(_setaf 0)${ESC_CLOSE}"
	local RED_BOLD
	RED_BOLD="${ESC_OPEN}${BOLD}$(_setaf 1)${ESC_CLOSE}"
	local GREEN_BOLD
	GREEN_BOLD="${ESC_OPEN}${BOLD}$(_setaf 2)${ESC_CLOSE}"
	local YELLOW_BOLD
	YELLOW_BOLD="${ESC_OPEN}${BOLD}$(_setaf 3)${ESC_CLOSE}"
	local BLUE_BOLD
	BLUE_BOLD="${ESC_OPEN}${BOLD}$(_setaf 4)${ESC_CLOSE}"
	local VIOLET_BOLD
	VIOLET_BOLD="${ESC_OPEN}${BOLD}$(_setaf 5)${ESC_CLOSE}"
	local CYAN_BOLD
	CYAN_BOLD="${ESC_OPEN}${BOLD}$(_setaf 6)${ESC_CLOSE}"
	local WHITE_BOLD
	WHITE_BOLD="${ESC_OPEN}${BOLD}$(_setaf 7)${ESC_CLOSE}"

	# Expose the variables we need in prompt command
	P_USER=${BRIGHT_GREEN}${USER_SYMBOL}
	P_HOST=${CYAN}${HOST_SYMBOL}
	P_WHITE=${WHITE}
	P_GREEN=${GREEN}
	P_BRIGHT_GREEN=${BRIGHT_GREEN}
	P_YELLOW=${BRIGHT_YELLOW}
	P_RED=${BRIGHT_RED}
	P_RESET=${RESET}
}

bash_prompt_command() {

	# This must be one line otherwise EXIT_CODE is always true
	local EXIT_CODE=$?
	local T_COLOUR
	T_COLOUR=""
	local MAXLENGTH
	MAXLENGTH=35
	local TRUNC_SYMBOL
	TRUNC_SYMBOL=".."
	local DIR
	DIR=${PWD##*/}
	local P_PWD
	P_PWD=${PWD/#$HOME/\~}

	MAXLENGTH=$(( ( MAXLENGTH < ${#DIR} ) ? ${#DIR} : MAXLENGTH ))

	local OFFSET
	OFFSET=$(( ${#P_PWD} - MAXLENGTH ))

	if [ ${OFFSET} -gt "0" ]; then
		P_PWD=${P_PWD:$OFFSET:$MAXLENGTH}
		P_PWD=${TRUNC_SYMBOL}/${P_PWD#*/}
	fi

	# Update terminal title
	if [[ $TERM == xterm* ]]; then
		echo -ne "\033]0;${P_PWD}\007"
	fi

	# Parse Git branch name
	P_GIT=$(parse_git_branch)

	# Parse venv info
	VENV_TEXT=$(add_venv_info)

	# Exit code
	if [[ $EXIT_CODE != 0 ]]; then
		T_COLOUR="${P_RED}"
	else
		T_COLOUR="${P_GREEN}"
	fi

	P_NUM_FILES="$(ls | wc -l) files"
	P_DIR_SIZE="$(ls -lah 2> /dev/null | grep -m 1 total | sed 's/total //')"

	P_TIME="\t"
	# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;93m\]\w\[\033[00m\]\$ '
	# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;93m\]\w\[\033[00m\]\ $ '
	# PS1="[\[$(tput sgr0)\]\[\033[38;5;2m\]\t\[$(tput sgr0)\]\[\033[38;5;15m\]] [\$?] \[$(tput sgr0)\]\[\033[38;5;11m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \\$\[$(tput sgr0)\] "
	# PS1="${debian_chroot:+($debian_chroot)}[\`if [ \$? = 0]; then echo \[\033[01;91m\]\t]\[\033[00m\]; else echo \[\033[01;92m\]\t\[\033[00m\]; fi\`] \[\033[01;93m\]\w\[\033[00m\] $ "
	PS1="${VENV_TEXT}[${T_COLOUR}${P_TIME}${P_RESET}] [${P_BRIGHT_GREEN}\u${P_RESET}@${P_GREEN}\h${P_RESET}] [${P_YELLOW}${P_PWD}${P_RESET}]${P_GIT} [${P_WHITE}${P_NUM_FILES}, ${P_DIR_SIZE}${P_RESET}]\n$ "
}

# https://stackoverflow.com/a/23408616/6247255
add_venv_info() {
	if [ -z "$VIRTUAL_ENV_DISABLE_PROMPT" ]; then
		VIRT_ENV_TXT=""
		if [ "x" != x ]; then
			VIRT_ENV_TXT=""
		else
			if [ "$(basename "$VIRTUAL_ENV")" = "__" ]; then
				# special case for Aspen magic directories
				# see http://www.zetadev.com/software/aspen/
				VIRT_ENV_TXT="[$(basename "$(dirname "$VIRTUAL_ENV")")]"
			elif [ "$VIRTUAL_ENV" != "" ]; then
				VIRT_ENV_TXT="($(basename "$VIRTUAL_ENV"))"
			fi
		fi
		if [ "${VIRT_ENV_TXT}" != "" ]; then
			echo "${VIRT_ENV_TXT} "
		fi
	fi
}

# display the branch in parentheses. (e.g. (master))
# have one star (e.g. (master* )) if there are unstaged files
# have another (e.g. (master *)) if there are untracked files
# both for both (e.g. (master**))
parse_git_branch() {
	local OUT
	OUT=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
	if [ "$OUT" != "" ]; then
		echo " ($OUT)"
	fi
}

[[ -f ~/.git-prompt.sh ]] && source ~/.git-prompt.sh
_bash_prompt_config
unset _bash_prompt_config

PROMPT_COMMAND=bash_prompt_command
