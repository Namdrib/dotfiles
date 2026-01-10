# Source powerline setup if it exists

# Required on fish 4.3+, otherwise the powerline setup fails
# See: set --global fish_key_bindings fish_default_key_bindings
set --global fish_key_bindings fish_default_key_bindings

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
