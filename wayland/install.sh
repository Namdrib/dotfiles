#!/bin/bash

# Make sure the destination directories exist
mkdir -pv \
	~/.config/fuzzel \
	~/.config/gtk-3.0 \
	~/.config/mako \
	~/.config/niri \
	~/.config/swayidle \
	~/.config/swaylock \
	~/.config/waybar \
	~/.config/xdg-desktop-portal

ln -svf $(realpath fuzzel.ini) ~/.config/fuzzel/fuzzel.ini
ln -svf $(realpath mako.cfg) ~/.config/mako/config
ln -svf $(realpath gtk-3.0-settings.ini) ~/.config/gtk-3.0/settings.ini
ln -svf $(realpath niri.kdl) ~/.config/niri/config.kdl
ln -svf $(realpath swayidle.cfg) ~/.config/swayidle/config
ln -svf $(realpath swaylock.cfg) ~/.config/swaylock/config
ln -svf $(realpath waybar-config.jsonc) ~/.config/waybar/config.jsonc
ln -svf $(realpath waybar-style.css) ~/.config/waybar/style.css
ln -svf $(realpath waybar-power_menu.xml) ~/.config/waybar/power_menu.xml
# Use KDE backends for things like file picker, secrets
ln -svf $(realpath niri-portals.conf) ~/.config/xdg-desktop-portal/niri-portals.conf

ln -svfT $(realpath darkman/dark-mode.d) ~/.local/share/dark-mode.d
ln -svfT $(realpath darkman/light-mode.d) ~/.local/share/light-mode.d
