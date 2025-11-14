#!/usr/bin/env bash

# GTK apps are not affected by the Plasma Global Theme, which only applies to Qt based programs.
# GTK themes can be installed here: Global Theme > Application Style > Configure GNOME/GTK Application Style.
# Reference: https://wiki.archlinux.org/title/Uniform_look_for_Qt_and_GTK_applications

case "$1" in
	dark) THEME=Adwaita-dark ;;
	light) THEME=Adwaita-dark ;;
	default) exit 1 ;;
esac

gsettings set org.gnome.desktop.interface gtk-theme "${THEME}"
