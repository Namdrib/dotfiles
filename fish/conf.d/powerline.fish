# Source powerline setup if it exists
# Arch, Ubuntu
if [ -f /usr/share/powerline/bindings/fish/powerline-setup.fish ]
	set fish_function_path $fish_function_path "/usr/share/powerline/bindings/fish"
	source /usr/share/powerline/bindings/fish/powerline-setup.fish
	powerline-setup
# Fedora
else if [ -f /usr/share/powerline/fish/powerline-setup.fish ]
	set fish_function_path $fish_function_path "/usr/share/powerline/fish"
	source /usr/share/powerline/fish/powerline-setup.fish
	powerline-setup
end
