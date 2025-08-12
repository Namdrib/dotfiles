#!/bin/bash

# Make sure the destination directories exist
mkdir -pv \
	~/.config/fuzzel \
	~/.config/mako \
	~/.config/niri \
	~/.config/swayidle \
	~/.config/swaylock \
	~/.config/waybar

ln -svf $(realpath fuzzel.ini) ~/.config/fuzzel/fuzzel.ini
ln -svf $(realpath mako.cfg) ~/.config/mako/config
ln -svf $(realpath niri.kdl) ~/.config/niri/config.kdl
ln -svf $(realpath swayidle.cfg) ~/.config/swayidle/config
ln -svf $(realpath swaylock.cfg) ~/.config/swaylock/config
ln -svf $(realpath waybar-config.jsonc) ~/.config/waybar/config.jsonc
ln -svf $(realpath waybar-style.css) ~/.config/waybar/style.css
ln -svf $(realpath waybar-power_menu.xml) ~/.config/waybar/power_menu.xml

