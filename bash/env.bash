# export EDITOR="vim"

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth:erasedups

# enable colours
export CLICOLOR=1

# useful for sudoedit, etc.
is-executable && export EDITOR=vim

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# allow bash wildcard globbing to match dotfiles
shopt -s dotglob

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

complete -d cd

# Do not autocomplete when accidentally pressing Tab on an empty line.
shopt -s no_empty_cmd_completion

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

### START ssh-agent
env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && source "$env" >| /dev/null ; }

agent_start () {
	(umask 077; ssh-agent >| "$env")
	source "$env" >| /dev/null
}

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ "$agent_run_state" = 2 ]; then
	agent_start
	ssh-add
elif [ "$SSH_AUTH_SOCK" ] && [ "$agent_run_state" = 1 ]; then
	ssh-add
fi
unset env
### END ssh-agent

# X stuff
# export DISPLAY=localhost:0.0
export LIBGL_ALWAYS_INDIRECT=1

# Ruby stuff
is-executable rbenv && eval "$(rbenv init -)"

# thefuck
is-executable thefuck && eval "$(thefuck --alias)"

# python venv stuff
export WORKON_HOME=~/.virtualenvs
VIRTUALENVWRAPPER_PYTHON=$(which python3)
export VIRTUALENVWRAPPER_PYTHON
[ -f /usr/local/bin/virtualenvwrapper.sh ] && source /usr/local/bin/virtualenvwrapper.sh

# opt out of dotnet CLI telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1

### START CDPATH
CDPATH=".:~"

if [ -d ~/.paths ]; then
	CDPATH="$CDPATH:~/.paths"
fi

export CDPATH
### END CDPATH
