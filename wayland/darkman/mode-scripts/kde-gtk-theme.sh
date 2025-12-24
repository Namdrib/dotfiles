#!/usr/bin/env bash

# GTK apps are not affected by the Plasma Global Theme, which only applies to Qt based programs.
# GTK themes can be installed here: Global Theme > Application Style > Configure GNOME/GTK Application Style.
# Reference: https://wiki.archlinux.org/title/Uniform_look_for_Qt_and_GTK_applications


if [[ $1 == dark ]] || [[ $0 == *"dark-mode"* ]]; then
	THEME=Adwaita-dark
	THEME2=Breeze-dark-gtk
elif [[ $1 == light ]] || [[ $0 == *"light-mode"* ]]; then
	THEME=Adwaita-dark
	THEME2=Breeze-dark-gtk
else
	echo "Unable to detect mode"
	exit 1
fi

echo "Switching to ${THEME} and ${THEME2}"
dbus-send --session --dest=org.kde.GtkConfig --type=method_call /GtkConfig org.kde.GtkConfig.setGtkTheme "string:${THEME2}"
gsettings set org.gnome.desktop.interface gtk-theme "${THEME}"
