# Source autojump setup if it exists
# Arch, Fedora, Ubuntu
if [ -f /usr/share/autojump/autojump.fish ]
	set fish_function_path $fish_function_path "/usr/share/autojump"
	source /usr/share/autojump/autojump.fish
end
