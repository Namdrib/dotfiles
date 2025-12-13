#!/usr/bin/env bash

# GTK apps are not affected by the Plasma Global Theme, which only applies to Qt based programs.
# GTK themes can be installed here: Global Theme > Application Style > Configure GNOME/GTK Application Style.
# Reference: https://wiki.archlinux.org/title/Uniform_look_for_Qt_and_GTK_applications

case "$1" in
	dark)
		THEME=Adwaita-dark
		THEME2=Breeze-dark-gtk
		;;
	light)
		THEME=Adwaita-dark
		THEME2=Breeze-dark-gtk
		;;
	default) exit 1 ;;
esac

dbus-send --session --dest=org.kde.GtkConfig --type=method_call /GtkConfig org.kde.GtkConfig.setGtkTheme "string:${THEME2}"
gsettings set org.gnome.desktop.interface gtk-theme "${THEME}"
