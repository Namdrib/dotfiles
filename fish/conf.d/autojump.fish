# Source autojump setup if it exists
# Check the autojump* package listing to see which files exist on each distro

# Arch
if [ -f /etc/fish/conf.d/autojump.fish ]
	set fish_function_path $fish_function_path "/etc/fish/conf.d"
	source /etc/fish/conf.d/autojump.fish
end

# Fedora, Ubuntu
if [ -f /usr/share/autojump/autojump.fish ]
	set fish_function_path $fish_function_path "/usr/share/autojump"
	source /usr/share/autojump/autojump.fish
end
